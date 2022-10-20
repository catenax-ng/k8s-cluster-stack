# How to bootstrap a Catena-X environment

The applicable documents are

1. How to use terraform in the [README.md](https://github.com/catenax-ng/k8s-cluster-stack/tree/main/terraform/README.md)
2. [Documentation](https://catenax-ng.github.io/docs/internal/how-to-setup-aks-cluster-via-terraform) of creating a new AKS Cluster

After completing the steps below, the following resources will be created:

- an [AKS](https://azure.microsoft.com/en-gb/services/kubernetes-service/#overview) cluster
- [ArgoCD](https://argoproj.github.io/cd/) that is accessible via configured domain
- a [default stack](https://github.com/catenax-ng/k8s-cluster-stack/tree/main/apps) of applications to support your DevOps activities

## Create a new Catena-X environment from scratch

For creating a new AKS Cluster we are using an Azure Service Principal Account (SP) and set up via terraform.

## Configure the AKS Cluster

Creating a subfolder and adjust variables of the new named AKS instance

## Install ArgoCD Cluster

To install the initial ArgoCD instance you have to connect ```kubectl``` to the previously created AKS instance.

## Configure GitHub OAuth app for login

ArgoCD users are enabled to log in with their GitHub account, so an OAuth App needs to be created inside the
GitHub organization and ArgoCD needs to be configured.

## Set up Remote Cluster

To deploy applications via the Core ArgoCD to remote clusters, the remote cluster needs to be introduced to the
Core ArgoCD instance.

### Adding remote clusters to an ApplicationSet
