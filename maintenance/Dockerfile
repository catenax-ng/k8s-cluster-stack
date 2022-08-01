FROM python:3

LABEL Maintainer="csaba-fabian"

RUN pip install --upgrade pip && \
    pip install requests, argparse, pyyaml, pygithub

WORKDIR /usr/app/src

COPY query.py ./
COPY config.json ./

CMD [ "python", "./query.py $GH_TOKEN $NR_API_KEY" ]
