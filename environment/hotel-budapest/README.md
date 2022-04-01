# Hotel-budapest environment

Besides the ArgoCD installation itself, we additionally create a separate kubernetes namespace per team and restrict
access to these by ArgoCD Projects and project scoped RBAC rules.
There should be one YAML file per team, that contains all the necessary resources for that team.
