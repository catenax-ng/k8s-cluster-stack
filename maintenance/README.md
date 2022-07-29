# Maintenance "dashboard"

  - Preliminary "version"

# query-github-newreleases-api.py

TODOs:
  - expose variables (json) to what?
  - add parameter with config file with files list to check in repo?
  - add parameter with config file for exceptions?
  - add scan for argocd and plugin(s)

## query-github-newreleases-api.py

First fetch the newreleases.io api key from [Vault](https://vault.demo.catena-x.net/ui/vault/secrets/devsecops/show/acme/machine-user)
and your/a github PAT that is authorized to read repo content (in the organizataion)
Then run the script with following parameters
  - github personal access token with read rights to the repo(s)
  - the nr api url: 'https://api.newreleases.io/v1/projects'
  - newreleases.io api key from vault
e.g.
```python
export GH_TOKEN = <insert PAT e.g. machine user from vault>
export NR_URL = 'https://api.newreleases.io/v1/projects'
export NR_API_KEY = <insert api key from vault>
python3 query_github_newreleases_api.py $GH_TOKEN $NR_URL $NR_API_KEY
```

## Dockerfile

TODOs:
  - schedule?
