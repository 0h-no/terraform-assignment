variable "helm_releases" {
  type = map(object({
    name         = string
    chart        = string
    version      = optional(string, "latest")
    namespace    = string
    replicas     = number
    ingress_host = string
    ingress_path = optional(string, "/")
  }))
  description = "The helm releases to create in the cluster"
  default = {}
}

variable "kubeconfig_path" {
  type = string
  description = "The path to the kubeconfig file"
  default = "~/.kube/config"
}

variable "kubeconfig_context" {
  type = string
  description = "The context to use in the kubeconfig file"
  default = "minikube"
}

variable "atomic" {
  type = bool
  description = "Whether to deploy the workload atomically"
  default = true
}