module "cluster-provision" {
  source = "../../modules/cluster-provision"
  kubeconfig_context = var.kubeconfig_context
  kubeconfig_path = var.kubeconfig_path
}
