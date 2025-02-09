#!/bin/bash

export TF_VAR_kubeconfig_path=~/.kube/config
export TF_VAR_kubeconfig_context=minikube

terraform_pipeline() {
  local workdir=${1:-.}

  terraform -chdir=$workdir init
  terraform -chdir=$workdir validate
  terraform -chdir=$workdir plan -out=tfplan -state-out=terraform.tfstate && \
  read -p "Do you want to apply the plan? (y/n) " -n 1 -r answer
  echo
  if [[ $answer =~ ^[Yy]$ ]]; then
    terraform -chdir=$workdir apply -auto-approve tfplan
  else
    echo "Plan was not applied."
  fi
}

terraform -version || {
  echo "Terraform is not installed. Please install it first."
  exit 1
}
