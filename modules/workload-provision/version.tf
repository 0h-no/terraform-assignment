terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.35.1"
    }
    helm = {
      source = "hashicorp/helm"
      version = "3.0.0-pre1"
    }
  }

  required_version = ">= 1.10"
}
