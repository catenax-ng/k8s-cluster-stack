# Argo Apps
Subfolders contain either Kubernetes kustomize resources or HELM Charts for deployments:

- argocd<br>
  Using kustomize to install core cluster (`overlays/core`) or and child cluster (`overlays/child-cluster-name`, e.g. 
  _hotel-budapest_).
- certmanager
- ingress-nginx (ingress controller)

## Adding Clusters
If you want to introdruce a new child/remote cluster as of now you've to add the 
[resource as secret manually](https://github.com/argoproj/argo-cd/blob/master/docs/operator-manual/declarative-setup.md#clusters)
(-> see _Cluster secret example_) because of the missing vault integration. 

Example Secret:
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: example-cluster-secret
  labels:
    argocd.argoproj.io/secret-type: cluster
  namespace: argocd
type: Opaque
stringData:
  name: example-cluster
  server: K8S_API_ENDPOINT_URL
  config: |
    {
      "bearerToken": "INSERT_TOKEN_HERE",
      "tlsClientConfig": {
        "insecure": false,
        "caData": "INSERT_CA_DATA_HERE"
      }
    }
```

Keep secrets _stringData.name_ (-> _example-cluster_) in mind, you'll need this later on.

### Add Cluster Secret To Core ArgoCD
To add the cluster resource to core ArgoCD, save the resource definition in path `apps/argocd/overlays/core` with
an appropriate naming (e.g. `name-cluster-secret.yaml` where the name portion is replaced accordingly) and add the file 
to `apps/argocd/overlays/core/kustomization.yaml`:

```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

bases:
  - ../../base

resources:
  - applicationsets/argo-applicationset.yaml
  - applicationsets/certmanager-applicationset.yaml
  - applicationsets/ingress-applicationset.yaml
  - name-cluster-secret.yaml

patchesStrategicMerge:
  - argo-url-argocd-cm.yaml
```
> Note:<br>
> Don't do this right now, as long as vault isn't integrated! Instead use 
> `kubectl apply -f apps/argocd/overlays/core/name-cluster-secret.yaml` to apply secret.

### Add Cluster To ArgoCD ApplicationSet
To get ArgoCD installed to a new remote cluster, edit `apps/argocd/overlays/core/applicationsets/argo-applicationset.yaml`
and add a new list element under _spec.generators_:

```yaml
      - cluster: example
        cluster-name: example-cluster
        overlay: overlays/example
        targetRevision: HEAD|TAG|BranchName
``` 

- `cluster` is a free text field and can be named arbitrary
- `cluster-name` references _stringData.name_ from 
- `overlay` points to an existing path according to cluster name, which must contain at least the files from
  `apps/argocd/overlays/example` folder
- `targetRevision` defines which git branch, git tag, etc. you want to use for this application and the remote cluster.

To get changes applyed, push it to GitHub.

## Default Apps
For each cluster a set of default apps will be installed which will be installed as ArgoCD Apps to Core ArgoCD instance
but not to remote ArgoCD instances.

As of now, the following default apps exist:
- [certmanager](/apps/certmanager)
- [ingress-nginx controller](/apps/ingress-nginx)

To apply these default apps to remote cluster, you've to add the cluster to each applicationSet file as explained for the
ArgoCD applicationSet. The default apps are also linked in `apps/argocd/overlays/core/kustomization.yaml`

Each default app points to a local Helm chart, which contains the specific application as dependency incl. matching 
`values.yaml`. In the `Chart.yaml` you can define the version to install:

```yaml
dependencies:
- name: ingress-nginx
  alias: ingress-nginx
  version: 4.0.18
  repository: https://kubernetes.github.io/ingress-nginx
```

## ToDo
- ingress for argo missing due to missing dependency (certificates)
- vault integration, therefore do not push any secrets