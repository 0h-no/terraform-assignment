provider "minikube" {
  kubernetes_version = var.kubernetes_version
}

resource "minikube_cluster" "docker" {
  driver       = "docker"
  cluster_name = var.kubeconfig_context
  # static_ip    = var.minikube_ip
  nodes        = 3
  addons       = [
    "dashboard",
    "default-storageclass",
    "ingress",
    # "ingress-dns",
    "storage-provisioner"
  ]
}

resource "terraform_data" "kubeconfig" {
  provisioner "local-exec" {
    command = "minikube -p $CLUSTER_NAME update-context"
    environment = {
      CLUSTER_NAME = var.kubeconfig_context
      KUBECONFIG = var.kubeconfig_path
    }
  }

  depends_on = [
    minikube_cluster.docker
  ]
}

# resource "terraform_data" "ingress-dns" {
#   provisioner "local-exec" {
#     command = <<EOT
#       [[ -d /etc/systemd/resolved.conf.d ]] || sudo mkdir -p /etc/systemd/resolved.conf.d
#       echo '[Resolve]
#       DNS=${var.minikube_ip}
#       Domains=~test | sudo tee /etc/systemd/resolved.conf.d/minikube.conf
#       sudo systemctl restart systemd-resolved
#     EOT
#   }

#   depends_on = [
#     minikube_cluster.docker
#   ]
# }
