# How to upgrade the Kube-prometheus-stack

1. Go to [here](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack) and check which CRDs are compatible with new version of stack
2. Go to [here](kustomization.yaml) and edit the version of CRD and add/remove the items if required
3. Go to [here](annotaions/argocd-annotations.yaml) and make sure the patches of annotations are applied to all active CRDs
4. Now you can update the new version of kube-prometheus-stack [here](Chart.yaml). 
