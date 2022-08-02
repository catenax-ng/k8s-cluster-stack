# Import necessary modules

import yaml, json, argparse, requests

# Arguments for ...

parser = argparse.ArgumentParser()
parser.add_argument('nr_api_key')       # ... newreleases.io api key
args = parser.parse_args()

# Variables for ...

nr_api_key = args.nr_api_key            # ... newreleases.io api key
results = []

# Define functions

def query_versions(name, dep, proj, pref):

# Query newreleases api

  kps_releases = []
  nr_api_url = configjson['newreleases_api_url']
  projects_url = f'{nr_api_url}/projects'
  # search for project
  search_url = f'{projects_url}/search?q={proj}'
  response_search = requests.get(search_url,
    headers = {'Content-Type':'application/json',
               'X-Key':nr_api_key})
  response_search.raise_for_status()
  json_response_search = response_search.json()
  # get id of project
  projectid = json_response_search['projects'][0]['id']
  # query project releases
  releases_url = f'{projects_url}/{projectid}/releases'
  response_releases = requests.get(releases_url,
    headers = {'Content-Type':'application/json',
               'X-Key':nr_api_key})
  response_search.raise_for_status()
  json_response_releases = response_releases.json()
  latest = json_response_releases['releases'][0]
  if 'prometheus' in proj:
    for rel in json_response_releases['releases']:
      if 'kube-prometheus-stack' in rel['version']:
        kps_releases.append(rel)
    latest = kps_releases[0]
  latestversion = latest.get('version').replace(pref,'') or latest.get('version')
  result = {'name': name, 'deployed': dep, 'latest': latestversion}
  results.append(result)

# Open the config

config = open('config.json')
configjson = json.load(config)

# Get the apps list

apps = configjson['apps']

# Make query for each app

for app in apps:
  query_versions(app['name'], app['deployed'], app['project'], app['prefix'])

#Print the results (change this to prometheus exporter)

print(results)
