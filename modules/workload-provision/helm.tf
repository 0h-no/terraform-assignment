provider "helm" {
  kubernetes = {
    config_path    = var.kubeconfig_path
    config_context = var.kubeconfig_context
  }
}

resource "helm_release" "helm_releases" {
  for_each   = var.helm_releases
  name       = each.value.name
  chart      = each.value.chart
  namespace  = each.value.namespace
  atomic     = var.atomic
  lint       = true

  set = [
    {
      name  = "replicaCount"
      value = each.value.replicas
    },
    {
      name = "image.tag"
      value = each.value.version
    },
    {
      name  = "ingress.hosts[0].host"
      value = each.value.ingress_host
    },
    {
      name  = "ingress.hosts[0].paths[0].path"
      value = each.value.ingress_path
    },
    {
      name  = "ingress.hosts[0].paths[0].pathType"
      value = "Prefix"
    }
  ]

  depends_on = [
    kubernetes_namespace.namespace
  ]
}
