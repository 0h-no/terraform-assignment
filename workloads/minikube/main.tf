module "workload-provision" {
  source = "../../modules/workload-provision"
  kubeconfig_path = var.kubeconfig_path
  kubeconfig_context = var.kubeconfig_context
  helm_releases = {
    podinfo = {
      name = "podinfo"
      chart = "../../charts/podinfo"
      namespace = "podinfo"
      replicas = 3
      version = "6.7.1"
      ingress_host = "podinfo.example"
    },
    podinfo_2nd_deployment = {
      name = "podinfo-2"
      chart = "../../charts/podinfo"
      namespace = "podinfo"
      replicas = 1
      version = "6.7.1"
      ingress_host = "podinfo-2.example"
    }
  }
}
