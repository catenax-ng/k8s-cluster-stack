FROM python:3

LABEL Maintainer="csaba-fabian"

RUN pip install --upgrade pip && \
    pip install requests, json, argparse

WORKDIR /usr/app/src

COPY query-release.py ./

CMD [ "python", "./query-release.py" ]
