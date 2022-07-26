FROM python:3.8.13-slim-bullseye

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install libcurl4-gnutls-dev librtmp-dev
RUN apt-get -y install openssl git curl vim
RUN apt-get -y install libgeos-dev libgdal-dev python3-gdal libgeoip-dev libmaxminddb0 libmaxminddb-dev mmdb-bin
RUN apt-get -y install postgresql-client
RUN apt-get -y install python3-dev python3-pil python3-gevent
RUN apt-get -y install libxslt1-dev libxml2-dev libffi-dev
RUN apt-get -y install libcairo2

ADD requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt # Install dependencies that take a long time
RUN rm requirements.txt

RUN apt-get -y install wget

# wkhtmltopdf 0.12.6 (with patched qt)
RUN wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.buster_amd64.deb
RUN apt -y install ./wkhtmltox_0.12.6-1.buster_amd64.deb
