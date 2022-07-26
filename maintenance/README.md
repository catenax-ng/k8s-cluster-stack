# Maintenance "dashboard"

  - Preliminary "version"
  - Separate current and latest version query scripts
  - check-local-helm-chart-version.py: base
  - query-newreleases.py: merge
  - merge corresponding queries from newreleases script to local one

## check-local-helm-chart-versions.py

Run this script in place, it will find all Chart.yaml files and print chart versions

TODOs:
  - prints -> variables
  - expose variables (json) to what?
  - add parameter with config file with files list to check in repo?

## query-newreleases.py

To run this, first fetch the newreleases.io api key from [Vault](https://vault.demo.catena-x.net/ui/vault/secrets/devsecops/show/acme/machine-user)
Then pass two parameters to the script
  - first, the nr api url: 'https://api.newreleases.io/v1/projects'
  - second, nr api key from vault
e.g.
```python
export NR_URL = 'https://api.newreleases.io/v1/projects'
export NR_API_KEY = <insert key here from vault>
python3 query-release.py $NR_URL $NR_API_KEY
```

## Dockerfile

TODOs:
  - add all necessary module installations
  - copy final file(s)
