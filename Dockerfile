# FROM node:6-stretch
FROM node:14.1.0

LABEL org.opencontainers.image.source="https://github.com/metalstormbass/goof" 
LABEL io.snyk.containers.image.dockerfile="/Dockerfile"

RUN mkdir /usr/src/goof
RUN mkdir /tmp/extracted_files
COPY . /usr/src/goof
WORKDIR /usr/src/goof


RUN apt-get update && apt install nodejs npm -y && apt install sa-exim -y && apt-get install iputils-ping -y && apt-get install nmap -y
RUN bin/sh -c apt-get isntall -y imagemagick 

RUN npm update
RUN npm install
EXPOSE 3001
EXPOSE 9229
ENTRYPOINT ["npm", "start"]
