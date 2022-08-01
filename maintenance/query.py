# Import necessary modules

import yaml, json, argparse, requests
from github import Github

# Arguments for ...

parser = argparse.ArgumentParser()
parser.add_argument('gh_token')         # ... GitHub personal access token
parser.add_argument('nr_api_key')       # ... newreleases.io api key
args = parser.parse_args()

# Variables for ...

gh_token = args.gh_token                # ... GitHub personal access token
nr_api_key = args.nr_api_key            # ... newreleases.io api key
results = []

# Define functions

def query_apis(path, dep, proj, pref):

# Query github api

  g = Github(gh_token)
  repo = g.get_repo(configjson['github_repo'])
  if('Chart.yaml' in path):
    print('this is a helm chart')
    chartyaml = yaml.safe_load(repo.get_contents(path).decoded_content.decode())
    app_name = chartyaml['name']
    app_version = chartyaml['version']
    try:
      dependencies = (chartyaml['dependencies'])
    except KeyError:
      dependencies = 'dependencies'
    if (dependencies != 'dependencies'):
      app_name = dependencies[dep]['name']
      app_version = dependencies[dep]['version']
    #result = {'name': chart_name, 'deployed': chart_version, 'latest': ''}
  elif('kustomization.yaml' in path):
    print('this is a kustomization')
    kustomization = repo.get_contents(path).decoded_content.decode()
    kustomizationyaml = yaml.safe_load(kustomization)
    app_name = kustomize['app']
    app_version = kustomizationyaml['resources'][1].split('/')[5].replace('v','')
    #result = {'name': app_name, 'deployed': app_version, 'latest': ''}
  elif('argo-vault-plugin.yaml' in path):
    print('this is a deployment')
    k8s_deployment = repo.get_contents(path).decoded_content.decode()
    k8s_deploymentyaml = yaml.safe_load(k8s_deployment)
    app_name = deployment['app']
    app_version = k8s_deploymentyaml['spec']['template']['spec']['initContainers'][0]['env'][0]['value']
    #result = {'name': app_name, 'deployed': app_version, 'latest': ''}
  #print(result)
#  results.append(result)

# Query newreleases api

  kps_releases = []
  nr_api_url = configjson['newreleases_api_url']
  projects_url = f'{nr_api_url}/projects'
#  response_projects = requests.get(projects_url,
#    headers = {'Content-Type':'application/json',
#               'X-Key':nr_api_key})
#  response_projects.raise_for_status()
#  jsonResponseProjects = response_projects.json()
#  r_ps = json.dumps(jsonResponseProjects)
#  projects = json.loads(r_ps)
  # search for project
  search_url = f'{projects_url}/search?q={proj}'
  response_search = requests.get(search_url,
    headers = {'Content-Type':'application/json',
               'X-Key':nr_api_key})
  response_search.raise_for_status()
  json_response_search = response_search.json()
  #print(json_response_search)
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
  latestversion = latest.get('version').rpartition('-')[-1] or latest.get('version')
  result = {'name': app_name, 'deployed': app_version, 'latest': latestversion}
  results.append(result)

  # select latest release (+remove prefix?)


# def query_newreleases(proj, pref) # ... query newreleases

# ... query newreleases api

config = open('config.json')
configjson = json.load(config)

charts = configjson['charts']
for chart in charts:
  print(chart['app'])
  query_apis(chart['path'], chart['dependency'], chart['project'], chart['prefix'])

kustomizes = configjson['kustomizes']
for kustomize in kustomizes:
  print(kustomize['app'])
  query_apis(kustomize['path'], kustomize['dependency'], kustomize['project'], kustomize['prefix'])

deployments = configjson['deployments']
for deployment in deployments:
  print(deployment['app'])
  query_apis(deployment['path'], deployment['dependency'], deployment['project'], deployment['prefix'])

print(results)
