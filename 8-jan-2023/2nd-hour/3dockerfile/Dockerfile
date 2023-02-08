FROM ubuntu:latest

LABEL Maintainer = "Aran Yogesh"

WORKDIR /var/www/html
COPY index.html /var/www/html
RUN apt-get -y update && apt-get -y install nginx 
