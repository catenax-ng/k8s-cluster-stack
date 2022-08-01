# Maintenance "dashboard"

  - Preliminary "version"

# query.py

TODOs:
  - expose variables (json) to what?
  - add parameter with config file for exceptions?

First fetch the newreleases.io api key from [Vault](https://vault.demo.catena-x.net/ui/vault/secrets/devsecops/show/acme/machine-user)
and your/a github PAT that is authorized to read repo content (in the organizataion)
Then run the script with following parameters
  - github personal access token with read rights to the repo(s)
  - newreleases.io api key from vault
e.g.
```python
export GH_TOKEN = <insert PAT e.g. machine user from vault>
export NR_API_KEY = <insert api key from vault>
python3 query.py $GH_TOKEN $NR_API_KEY
```

## config.json

Mapping between github helm charts/kustomizations/deployments and newreleases.io project in json format

```json
{
  <github repo>:<owner/repo>
  <newreleases.io api url>:<value>
  <charts>:[
    {
      <app>:<app name>
      <path>:<path in github repo>
      <deplendency>:<index of dependencies array(starts at 0)>
      <project>:<newreleases.io project name>
      <prefix>:<prefix of version in newreleases.io>
    }
  ]
  <kustomizes>:[<same as charts>]
  <deployments>:[<same as charts>]
}
```

## Dockerfile

TODOs:
  - schedule?
