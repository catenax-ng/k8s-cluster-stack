# Import necessary modules

from flask import Flask
from werkzeug.middleware.dispatcher import DispatcherMiddleware
from prometheus_client import make_wsgi_app
#from prometheus_client import start_http_server

import json, requests
#import argparse
from os import environ

from prometheus_client.core import GaugeMetricFamily, REGISTRY, CounterMetricFamily

# Arguments for ...

#parser = argparse.ArgumentParser()
#parser.add_argument('nr_api_key')       # ... newreleases.io api key
#args = parser.parse_args()

# Variables for ...

#nr_api_key = args.nr_api_key            # ... newreleases.io api key
nr_api_key = environ['NR_API_KEY']
results = []

#totalRandomNumber = 0
class VersionsCollector(object):
  def __init__(self):
    pass
  def collect(self):
    gauge = GaugeMetricFamily('appversions', 'A gauge for software versions', labels=['name','deployed','latest'])
    for r in results:
      gauge.add_metric([r['name'],r['deployed'],r['latest']], 1.0)
    yield gauge
    #count = CounterMetricFamily("random_number_2", "A random number 2.0", labels=['randomNum'])
    #global totalRandomNumber
    #totalRandomNumber += random.randint(1,30)
    #count.add_metric(['random_num'], totalRandomNumber)
    #yield count

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

collectors = list(REGISTRY._collector_to_names.keys())
for collector in collectors:
  REGISTRY.unregister(collector)
REGISTRY.register(VersionsCollector())

# Create my app
app = Flask(__name__)

# Add prometheus wsgi middleware to route /metrics requests
app.wsgi_app = DispatcherMiddleware(app.wsgi_app, {
    '/metrics': make_wsgi_app()
})

#app.run()

# Start http server
#start_http_server(8000)

#print(results)
