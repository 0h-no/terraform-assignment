variable "kubeconfig_path" {
  type = string
  description = "The path to the kubeconfig file"
}

variable "kubeconfig_context" {
  type = string
  description = "The context to use in the kubeconfig file (also the name of the cluster)"
}
