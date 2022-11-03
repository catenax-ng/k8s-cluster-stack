# ArgoCD

## Installation

For installation instructions, please refer to installation section in
the [bootstrap.md](../../BOOTSTRAP.md#install-core-argocd-cluster).

## Maintenance

### ArgoCD

#### Code Preparation

Hey, there's a new ArgoCD version, then follow these steps:

- Create a new branch from `main`, e.g. `chore/bump_argocd_version`
- Checkout new branch
- ArgoCD version has to be updated in `apps/argocd/base/kustomization.yaml`

    ```yaml
    resources:
      - namespace.yaml
      - https://raw.githubusercontent.com/argoproj/argo-cd/v2.3.11/manifests/ha/install.yaml
      - rbac-secret-access.yaml # grant avp access to secret with AVP configuration
    ```

- Update `targetRevision` according to new ArgoCD version for testing only for _devsecops-testing_ cluster in ArgoCD
  ApplicationSet `environments/core/applicationsets/argo-applicationset.yaml`:

  ```yaml
  spec:
    generators:
      - list:
          elements:
            - cluster: devsecops-testing
              cluster-name: devsecops-testing
              overlay: overlays/devsecops-testing
              targetRevision: ArgoCD-v2.3.11_AVP-v0.13.0
  ```

  Change the _targetRevision_ from `ArgoCD-v2.3.10_AVP-v0.13.0` → `ArgoCD-v2.3.11_AVP-v0.13.0`. Ensure to only change
  the ArgoCD part of the tag, not the AVP part!
- Create PR to merge branch `chore/bump_argocd_version` into `main`
- Approve PR and merge to main
- Create an annotated Git Tag in `main` branch named `ArgoCD-v2.3.11_AVP-v0.13.0`, ensure the tag points to the merge
  commit ID from PR in the step before.

#### Testing

- Sync ArgoCD App _devsecops-testing-argo_ on core ArgoCD
- New ArgoCD version will be deployed to _devsecops-testing_ cluster
- Test if ArgoCD on _devsecops-testing_ cluster behaves as expected.

#### Rollout To Productive Clusters

- Create a new branch from `main`, e.g. `chore/rollout_argocd_v2.3.11`
- Checkout new branch
- Update `targetRevision` according to new ArgoCD version for all remaining clusters
- Create PR to merge branch `chore/rollout_argocd_v2.3.11` into `main`
- Approve PR and merge to `main` branch
- Sync remaining ArgCD Apps on core ArgoCD
- New ArgoCD version will be deployed to remote clusters

### ArgoCD Vault Plugin

#### Code Preparation

- Create a new branch from `main`, e.g. `chore/bump_avp_version`
- Checkout new branch
- ArgoCD Vault Plugin version has to be updated in `apps/argocd/base/plugins/argo-vault-plugin.yaml`

  ```yaml
  initContainers:
    - name: download-tools
      image: alpine:3.16
      command: [sh, -c]
      env:
      - name: AVP_VERSION
        value: "1.13.0"
  ```
- Update `targetRevision` according to new ArgoCD Vault Plugin version for testing only for _devsecops-testing_
  cluster in ArgoCD
  ApplicationSet `environments/core/applicationsets/argo-applicationset.yaml`:

   ```yaml
   spec:
     generators:
       - list:
           elements:
             - cluster: devsecops-testing
               cluster-name: devsecops-testing
               overlay: overlays/devsecops-testing
               targetRevision: ArgoCD-v2.3.11_AVP-v1.13.0
   ```

Change the _targetRevision_ from `ArgoCD-v2.3.10_AVP-v0.13.0` → `ArgoCD-v2.3.11_AVP-v1.13.0`. Ensure to only change the
AVP part of the tag, not the ArgoCD part!

- Create PR to merge branch `chore/bump_avp_version` into `main`
- Approve PR and merge to main
- Create an annotated Git Tag in `main` branch named `ArgoCD-v2.3.11_AVP-v1.13.0`, ensure the tag points to the merge
  commit ID from PR in the step before.

#### Testing

- Sync ArgoCD App _devsecops-testing-argo_ on core ArgoCD
- New ArgoCD Vault Plugin version will be deployed to _devsecops-testing_ cluster
- Test if ArgoCD on _devsecops-testing_ cluster behaves as expected.

#### Rollout To Productive Clusters

- Create a new branch from `main`, e.g. `chore/rollout_avp_v1.13.0`
- Checkout new branch
- Update `targetRevision` according to new ArgoCD Vault Plugin version for all remaining clusters
- Create PR to merge branch `chore/rollout_avp_v1.13.0` into `main`
- Approve PR and merge to `main` branch
- Sync remaining ArgCD Apps on core ArgoCD
- New ArgoCD Vault Plugin version will be deployed to remote clusters
