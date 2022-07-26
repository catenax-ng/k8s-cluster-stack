import requests, json, argparse
from requests.exceptions import HTTPError

try:
    parser = argparse.ArgumentParser()
    parser.add_argument('url')
    parser.add_argument('token')
    args = parser.parse_args()
    nr_url = args.url
    nr_token = args.token
    response_projects = requests.get(nr_url,
        headers = {'Content-Type':'application/json',
                   'X-Key':nr_token})
    response_projects.raise_for_status()
    jsonResponseProjects = response_projects.json()
    r_ps = json.dumps(jsonResponseProjects)
    projects = json.loads(r_ps)
    #print(projects)
    for project in projects['projects']:
        projectname = project.get('name')
        projecturl = project.get('url')
        projectid = project.get('id')
        releasesurl = f'{nr_url}/{projectid}/releases'
        response_releases = requests.get(releasesurl,
            headers = {'Content-Type':'application/json',
                       'X-Key':nr_token})
        response_releases.raise_for_status()
        jsonResponseReleases = response_releases.json()
        releasesjson  = json.dumps(jsonResponseReleases)
        releases = json.loads(releasesjson)
        latest = releases['releases'][0]
        latestversion = latest.get('version')
        releasedate = latest.get('date')
        print(f'\nProject name:\t\t{projectname}')
        print(f'Project url:\t\t{projecturl}')
        print(f'Latest version:\t\t{latestversion}')
        print(f'Release date:\t\t{releasedate}')
        if latest.get('has_note'):
            latestversion = latest.get('version')
            notesurl = f'{releasesurl}/{latestversion}/note'
            response_notes = requests.get(notesurl,
                headers = {'Content-Type':'application/json',
                           'X-Key':nr_token})
            response_notes.raise_for_status()
            jsonResponseNotes = response_notes.json()
            notesjson = json.dumps(jsonResponseNotes)
            notes = json.loads(notesjson)
            #print(notes)
            print("This release has notes available\n")
except HTTPError as http_err:
    print(f'HTTP error occurred: {http_err}')
except Exception as err:
    print(f'Other error occurred: {err}')
