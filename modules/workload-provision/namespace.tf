provider "kubernetes" {
  config_path    = var.kubeconfig_path
  config_context = var.kubeconfig_context
}

resource "kubernetes_namespace" "namespace" {
  for_each = toset([for _, release in var.helm_releases : release.namespace])
  metadata {
    name = each.key
  }
}
