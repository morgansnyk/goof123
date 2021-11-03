# FROM node:6-stretch
FROM node:14.1.0

LABEL org.opencontainers.image.source="https://github.com/metalstormbass/goof" 
LABEL io.snyk.containers.image.dockerfile="/Dockerfile"

RUN mkdir /usr/src/goof
RUN mkdir /tmp/extracted_files
COPY . /usr/src/goof
WORKDIR /usr/src/goof

RUN /bin/sh -c apt-get install -y imagemagick
RUN npm install --production --unsafe-perm
RUN npm dedupe

RUN npm update
RUN npm install
EXPOSE 3001
EXPOSE 9229
EXPOSE 3000
ENTRYPOINT ["npm", "start"]
