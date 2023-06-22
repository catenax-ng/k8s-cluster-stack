# Maintenance notes

## Big jump upgrade

Following guide is recommended approach for special, exceptional use case when installed kube-prometheus-stack version is way behind current release (few iterations).
It is advised that instead of performing squential upgrade to each major version and updating CRDs which is considered time consuming activity, install it from the scratch after removal of the stack. 

Just for historic perspective and example purpose, procedure was build upon moving from 35.5.1 to 47.0.0.


**Preparation:**

1. Make sure you are able to access kubernetes cluster from CLI, reachable with kubectl command. Use cluster contexts to easly switch between the clusters.
2. Ensure Auto Sync policy is set to disabled on the kube-prometheus-stack applications.


**Execution:**
1. First it's better to test installation on the devsecops-testing cluster. Make appropriate change at targetRevision in the ApplicationSet [here](https://github.com/catenax-ng/k8s-cluster-stack/blob/chore/prometheus-upgrade-procedure/environments/core/applicationsets/kube-prometheus-stack-applicationset.yaml)
   pointing to your branch.
3. Remove cluster's relevant application kube-prometheus-stack in ArgoCD (at core cluster). The tile will remain visible in yellow state since ApplicationSet is still active but the application itself will be gone.
4. Delete all kube-prometheus-stack CRDs using kubectl command line. List of CRDs you can find [here](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack#uninstall-helm-chart) in the Uninstall Helm Chart section. Before executing commands make sure you query proper cluster.
  ```console
   kubectl delete crd <name of the CRD>
  ```
5. Update kube-prometheus-stack version [here](https://github.com/catenax-ng/k8s-cluster-stack/blob/chore/prometheus-upgrade-procedure/apps/kube-prometheus-stack/Chart.yaml) using the branch you pointed at step 1 and push to repository.
6. When change is detected by ArgoCD (you might need to use Refresh button of the Application to epedite it),trigger synchronization manually (Sync button at Application level). It will take few minutes to spin up.
7. Expectation is to have Application kube-prometheus-stack being in green, healthy status.
8. Make sure you can reach Graphana, please login and check basic functionality.
9. Proceed further only if the above step 8 is fulfilled.
10. Submit a PR to change kube-prometheus-stack version on the main branch.
11. Repeat steps 2-8 for each clusters' application.
12. Revert change from step 1 so that targetRevision points to HEAD for devsecops-testing cluster as it was originally.
    
