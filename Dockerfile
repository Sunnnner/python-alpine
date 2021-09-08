FROM python:3.7.9-alpine3.12


ADD requirements.txt /requirements.txt

RUN set -e ; \
    sed -i s/dl-cdn.alpinelinux.org/$ALPINE_MIRROR/ /etc/apk/repositories ; \
    apk update ; \
    apk add --no-cache postgresql-client gcc g++ musl-dev postgresql-dev wget ca-certificates ; \
    pip install --no-cache -r /requirements.txt ; \
    apk del gcc g++ musl-dev postgresql-dev wget ca-certificates ;

