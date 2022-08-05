FROM python:3

LABEL Maintainer="catenax-ng"

ENV NR_API_KEY="valuefromdockerfile"

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir requests argparse Flask prometheus_client uwsgi pyjson

WORKDIR /usr/app/src

COPY maintenance-dashboard-app.py ./
COPY config.json ./

#ENTRYPOINT ["sh","-c","echo","${NR_API_KEY}"]

CMD [ "uwsgi","--http",":8000","--wsgi-file","maintenance-dashboard-app.py","--callable","app" ]
