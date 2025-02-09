variable "kubernetes_version" {
  type = string
  description = "The version of Kubernetes to deploy"
  default = "v1.32.0"
}

variable "kubeconfig_path" {
  type = string
  description = "The path to the kubeconfig file"
}

variable "kubeconfig_context" {
  type = string
  description = "The context to use in the kubeconfig file (also the name of the cluster)"
}
