import yaml
from pathlib import Path

print('\nHelm chart versions in this repository\n')

files = Path('..').rglob('Chart.yaml')
for file in files:
    chart = open(file, 'r').read()
    try:
        chartyaml = yaml.safe_load(chart)
    except yaml.YAMLError as yerr:
        print(yerr)
    print('Local chart name:', chartyaml['name'], ', version:', chartyaml['version'])
    try:
        dependencies = (chartyaml['dependencies'])
    except KeyError as kerr:
        dependencies = 'dependencies'
    #print(dependencies)
    if chartyaml['name'] == 'tls':
        print('\nNot handling the tls application, sorry, but not sorry :D\n')
    elif chartyaml['dependencies'] == 'dependencies':
        print('\nThis chart has no dependencies\n')
    else:
        for dependency in dependencies:
            print('\tDependencies:')
            print('\t\tName:', dependency['name'])
            print('\t\tCurrent version:', dependency['version'], '\n')
