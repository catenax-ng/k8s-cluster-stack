# How to bootstrap a Catena-X environment

The following guide will walk you through the process of creating a new Catena-X environment from scratch.
After completing these steps the following resources will be created:

- an [AKS](https://azure.microsoft.com/en-gb/services/kubernetes-service/#overview) cluster
- [ArgoCD](https://argoproj.github.io/cd/) that is accessible via configured domain
- a [default stack](./apps) of applications to support your DevOps activities 


## Create an AKS cluster 

To set up AKS, we are using terraform. 

> __NOTE__: Applying terraform plans is done locally, since we do not expect a lot of clusters.
Also, we'll use Gardener in foreseeable future and the whole setup will change.


### Create a service principal

> __NOTE__: This Step is optional. You can also reuse existing ones

To set up the AKS cluster, we need an Azure Service Principal Account. You can create it like follows:

```shell
# Follow login instructions in your browser
az login --tenant catenax.onmicrosoft.com
az ad sp create-for-rbac --skip-assignment
```

The last command will print a json object with the service principal details. The two important properties are
_appId_ and _password_, which will be used as credentials for the AKS cluster.

### Create the necessary Azure resources

```shell
terraform init

# Set the service principle to use via environment
# <sp client id> is the value of 'appId' from the service principal json output
# <sp client secret> is the value of 'password' from the service principal json output
export TF_VAR_service_principal_client_id=<sp client id>
export TF_VAR_service_principal_client_secret=<sp client secret>

terraform plan -var-file=environments/<environment>.tfvars -out <environment>.plan
terraform apply <environment>.plan
```


## Install Core ArgoCD Cluster

To install the initial ArgoCD instance you have to connect ```kubectl``` to the previously created AKS instance.
Therefor open the AKS resource in [Azure portal](https://portal.azure.com/) and follow the _connect_ instructions.

Once you are connected via ```kubectl```, you can use _kustomize_ to apply the necessary kubernetes resources.
From the top level directory of this repository run:

```kubect apply -k argocd```

> Note: You may have to execute this twice, since we are using ArgoCD CRDs, which are not recognized on the first run.


## Environment provisioning via Core ArgoCD

To deploy applications via the Core ArgoCD to remote clusters, you need to introduce the remote cluster to the
Core ArgoCD instance. Afterwards, you can configure the cluster as destination in the needed ArgoCD ApplicationSets.

### Introducing a new remote cluster

### Adding remote clusters to an ApplicationSet