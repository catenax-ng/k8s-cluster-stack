# Import necessary modules

import yaml, json, argparse, requests
from github import Github

# Arguments for ...

parser = argparse.ArgumentParser()
parser.add_argument('gh_token')         # ... GitHub personal access token
parser.add_argument('nr_api_url')           # ... newreleases.io api url
parser.add_argument('nr_api_key')       # ... newreleases.io api key
args = parser.parse_args()

# Variables for ...

gh_token = args.gh_token                # ... GitHub personal access token
nr_api_url = args.nr_api_url                # ... newreleases.io api url
nr_api_key = args.nr_api_key            # ... newreleases.io api key

# Define variables of type list for ...

gh_charts = []      # ... GitHub Helm charts
nr_projects = []    # ... newreleases.io projects
kps_releases = []   # ... Kube Prometheus Stack releases
versions_list = []  # ... List for all data about charts/app current and latest versions

# Query Chart.yaml files from catenax-ng/k8s-cluster-stack github repo and add chart/dependency versions to list
# argument for repo owner and name?

g = Github(gh_token)
repo = g.get_repo('catenax-ng/k8s-cluster-stack')
contents = repo.get_contents('')
while contents:
    file_content = contents.pop(0)
    if file_content.type == 'dir':
        contents.extend(repo.get_contents(file_content.path))
    elif file_content.name == 'Chart.yaml':
        chart = file_content.decoded_content.decode()
        try:
            chartyaml = yaml.safe_load(chart)
        except yaml.YAMLError as yerr:
            print(yerr)
        gh_chart_name = chartyaml['name']
        gh_chart_version = chartyaml['version']
        try:
            dependencies = (chartyaml['dependencies'])
        except KeyError as kerr:
            dependencies = 'dependencies'
        if ((gh_chart_name != 'tls') and (dependencies != 'dependencies')):
            for dependency in dependencies:
                dependency_name = dependency['name']
                dependency_version = dependency['version']
                dependency_chart = {'name': dependency_name, 'version': dependency_version}
                gh_charts.append(dependency_chart)
        elif(gh_chart_name != 'tls'):
            gh_chart = {'name': gh_chart_name, 'version': gh_chart_version}
            gh_charts.append(gh_chart)

json_gh_charts = json.dumps(gh_charts,  indent=2)
#print('\nJSON:\n\n', json_gh_charts)

# Query configured projects from newreleases.io

response_projects = requests.get(nr_api_url,
    headers = {'Content-Type':'application/json',
               'X-Key':nr_api_key})
response_projects.raise_for_status()
jsonResponseProjects = response_projects.json()
r_ps = json.dumps(jsonResponseProjects)
projects = json.loads(r_ps)

# For each project query releases and add versions to list

for project in projects['projects']:
    projectname = project.get('name')
    projectnameraw = projectname.rpartition('/')[-1] or projectname
    projecturl = project.get('url')
    projectid = project.get('id')
    releasesurl = f'{nr_api_url}/{projectid}/releases'
    response_releases = requests.get(releasesurl,
        headers = {'Content-Type':'application/json',
                   'X-Key':nr_api_key})
    response_releases.raise_for_status()
    jsonResponseReleases = response_releases.json()
    releasesjson  = json.dumps(jsonResponseReleases)
    releases = json.loads(releasesjson)
    latest = releases['releases'][0]
# Kube Prometheus Stack is an exception as the helm chart is in a repo that contains
# multiple charts for various prometheus apps
    if 'prometheus' in projectname:
        for rel in releases['releases']:
            if 'kube-prometheus-stack' in rel['version']:
                kps_releases.append(rel)
        latest = kps_releases[0]
    latestversion = latest.get('version').rpartition('-')[-1] or latest.get('version')
    nr_project = {'name': projectname, 'version': latestversion}
    nr_projects.append(nr_project)

json_nr_projects = json.dumps(nr_projects, indent=2)
#print('\nJSON:\n\n', json_nr_projects)

# Look for the chart name in the configured projects in newreleases.io and add them
# to the final list

for chart in gh_charts:
    for project in nr_projects:
        if ('prometheus' not in chart['name']):
            if (chart['name'] in project['name']):
                entry = {'name': chart['name'], 'current': chart['version'], 'project': project['name'], 'latest': project['version']}
                versions_list.append(entry)
        elif ('prometheus' in project['name']):
            entry = {'name': chart['name'], 'current': chart['version'], 'project': project['name'], 'latest': project['version']}
            versions_list.append(entry)

json_versions_list = json.dumps(versions_list, indent=2)
print('\nJSON:\n\n', json_versions_list)

