# FROM node:6-stretch
FROM node:14.1.0

LABEL org.opencontainers.image.source="https://github.com/metalstormbass/goof" 
LABEL io.snyk.containers.image.dockerfile="/Dockerfile"

RUN mkdir /usr/src/goof
RUN mkdir /tmp/extracted_files
COPY . /usr/src/goof
WORKDIR /usr/src/goof

RUN apk add postgresql-client jq=1.6_rc1-r0 curl=7.64.0-r3


RUN npm update
RUN npm install
EXPOSE 3001
EXPOSE 9229
ENTRYPOINT ["npm", "start"]
