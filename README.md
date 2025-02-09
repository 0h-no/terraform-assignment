# Automating Infrastructure with Terraform

This project demonstrates helm chart deployment on a Kubernetes cluster (specifically Minikube in this case) using Terraform.

## Getting started

Install the following:

* [Docker](https://docs.docker.com/get-docker/)
* [Minikube](https://minikube.sigs.k8s.io/docs/start/?arch=%2Flinux%2Fx86-64%2Fstable%2Fbinary+download)
* [Helm](https://helm.sh/docs/intro/install/)
* [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

If you have Ubuntu, you can run `prerequisites-ubuntu.sh` to install all of the above at once.

## Creating the Minikube cluster

The helm charts need to be deployed onto an existing cluster. By default, the project assumes the presence of `~/.kube/config` and expects to have a `minikube` context (these defaults can be changed in `terraform-pipeline.sh`).

To create a new cluster from scratch run `setup-cluster.sh`. This will run `terraform plan` and `terraform apply` for the `minikube` profile and set up the cluster with an nginx ingress controller.

## Deploying helm charts

Now we can do what we wanted in the first place: Run `deploy-workloads.sh` to deploy the charts on the cluster we created. Currently, only a local chart is configured, but remote charts can be added as well by specifying a URL instead of a local path.

### Adding new charts

* Edit `workloads/minikube/main.tf` to add more charts.
* For a new local chart run `helm create <CHART-NAME>` in the `charts` directory and in the workload configuration file above refer to it by writing `chart = "../../<CHART-NAME>"`

## Verifying the ingresses

Since the embedded minikube installation doesn't use the ingress-dns addon (I didn't want to ask for root permissions just to edit `systemd-resolved` - it seems a bit out of scope) you will have to add temporary entries to your `/etc/hosts` file in order to be able to access the ingresses:

`echo $(minikube ip) podinfo{,-2}.example >> /etc/hosts`
