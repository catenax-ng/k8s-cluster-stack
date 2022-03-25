# Argo Apps
Subfolders contain either Kubernetes kustomize resources or HELM Charts for deployments:

- argocd<br>
  Using kustomize to install core cluster (`overlays/core`) or and child cluster (`overlays/child-cluster-name`, e.g. 
  _hotel-budapest_).
- certmanager
- ingress-nginx (ingress controller)

## Adding Clusters
If you want to introdruce a new child cluster as of now you've to add the 
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

## Add Cluster To ArgoCD ApplicationSet
To get ArgoCD installed to a new remote cluster, edit `apps/argocd/overlays/core/applicationsets/argo-applicationset.yaml`
and add a new list element under spec.generators:

```yaml
      - cluster: cluster-name
        cluster-name: cluster-name
        overlay: overlays/cluster-name
        targetRevision: HEAD|TAG|OrBranchName
```

_cluster_