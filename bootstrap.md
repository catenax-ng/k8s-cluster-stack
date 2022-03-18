# How to bootstrap a Catena-X environment

The following guide will walk you through the process of creating a new Catena-X environment from scratch.
After completing these steps the following resources will be created:

- an [AKS](https://azure.microsoft.com/en-gb/services/kubernetes-service/#overview) cluster
- [ArgoCD](https://argoproj.github.io/cd/) that is accessible via configured domain
- a [default stack](./apps) of applications to support your DevOps activities 


## Create an AKS cluster 

To set up AKS, we are using terraform.

...

```shell
# Set the service principle to use via environment
export TF_VAR_service_principal_client_id=<sp client id>
export TF_VAR_service_principal_client_secret=<sp client secret>
```


## Install Core ArgoCD Cluster

`kubect apply -k argocd`
> Note: Execute twice to get ApplicationSet realy working.


## Environment provisioning via Core ArgoCD

To deploy applications via the Core ArgoCD to remote clusters, you need to introduce the remote cluster to the
Core ArgoCD instance. Afterwards, you can configure the cluster as destination in the needed ArgoCD ApplicationSets.

### Introducing a new remote cluster

### Adding remote clusters to an ApplicationSet