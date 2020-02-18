FROM python:3.7-slim-buster

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install openssl git curl vim wget
RUN apt-get -y install libgeos-dev libgdal-dev python3-gdal libgeoip-dev
RUN apt-get -y install postgresql-client
RUN apt-get -y install python3-dev python3-pil python3-gevent
RUN apt-get -y install libxslt1-dev libxml2-dev libffi-dev

ADD requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt # Install dependencies that take a long time
RUN rm requirements.txt
