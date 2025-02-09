#!/bin/bash

CLUSTER=minikube

. terraform-pipeline.sh
terraform_pipeline workloads/$CLUSTER
