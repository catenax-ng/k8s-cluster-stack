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


## Configure GitHub OAuth app for login

We enable users of ArgoCD to log in with their GitHub account. To get that working, we need to create an OAuth App inside
our GitHub organization and configure ArgoCD to use it. We need an OAuth app for each of our ArgoCD instances, since each instance
will have a unique redirect URL.

You can follow [the official guide from GitHub](https://docs.github.com/en/developers/apps/building-oauth-apps/creating-an-oauth-app)
on how to create an OAuth app.

You'll need to fill in the following information:

- _Application name_: follow the naming pattern of \<environment\>-argocd. i.e. core-argocd
- _Homepage URL_: The base URL of the ArgoCD instance. i.e. https://argo.core.demo.catena-x.net/
- _Authorization callback URL_: The dex callback URL. i.e. https://argo.core.demo.catena-x.net/api/dex/callback

Entering the necessary information and clicking the button _Register Application_ will create the OAuth app and generate a clientID.
Next step is to create a clientSecret, by clicking _Generate a new client secret_ in the _Client secrets_ section.
Remember both, clientID and clientSecret, since they are needed for ArgoCD configuration. Also, the clientSecret will disappear once you refresh the page.
If you accidentally refreshed the page, without remembering the secret, just delete it and create a new one.

Configuring ArgoCD to use the OAuth app is yet still a manual process.
After installing ArgoCD like described in the previous section, you'll find a configMap resource called 'argocd-cm'
in the argocd namespace of the kubernetes cluster. This configMap contains the Dex settings for GitHub login.

You can edit the configMap in place, by connecting to the kubernetes cluster hosting the ArgoCD instance you want to configure.
Once you are connected via ```kubectl```, you can interactively edit the configMap with this command:
```kubectl -n argocd edit configmap argocd-cm```.
This will open the default editor configured for your shell. You should see a YAML definition similar to this:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: argocd-cm
data:
  dex.config: |
    connectors:
      - type: github
        id: github
        name: GitHub
        config:
          clientID: $dex.github.clientId
          clientSecret: $dex.github.clientSecret
          orgs:
          - name: catenax-ng
  url: https://argo.core.demo.catena-x.net
```

Replace the placeholders ```$dex.github.clientId``` and ```$dex.github.clientSecret```with the values from your newly created 
GitHub OAuth app and save the changes.
Afterwards verify, if you can log in to ArgoCD via GitHub.


## Environment provisioning via Core ArgoCD

To deploy applications via the Core ArgoCD to remote clusters, you need to introduce the remote cluster to the
Core ArgoCD instance. Afterwards, you can configure the cluster as destination in the needed ArgoCD ApplicationSets.

### Introducing a new remote cluster

### Adding remote clusters to an ApplicationSet
