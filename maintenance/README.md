# Maintenance "dashboard"

  - version 1.0

# maintenance-dashboard-app.py

TODO:

  - annotate newreleases.io api key from [Vault](https://vault.demo.catena-x.net/ui/vault/secrets/devsecops/show/acme/machine-user) in the pod as environment variable "NR_API_KEY"

## config.json

Mapping between github helm charts/kustomizations/deployments and newreleases.io project in json format

```json
{
  "<github repo>":"<owner/repo>"
  "<newreleases.io api url>":"<value>"
  "<charts>":[
    {
      "<app>":"<app name>"
      "<path>":"<path in github repo>"
      "<deplendency>":"<index of dependencies array(starts at 0)>"
      "<project>":"<newreleases.io project name>"
      "<prefix>":"<prefix of version in newreleases.io>"
    }
  ]
  "<kustomizes>":[{"<same structure>": "<as charts>"}]
  "<deployments>":[{"<same structure>": "<as charts>"}]
}
```
