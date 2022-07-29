FROM python:3

LABEL Maintainer="csaba-fabian"

RUN pip install --upgrade pip && \
    pip install requests, argparse, pyyaml, pygithub

WORKDIR /usr/app/src

COPY query-github-newreleases-api.py ./

CMD [ "python", "./query-github-newreleases-api.py $GH_TOKEN $NR_URL $NR_API_KEY" ]
