# FROM node:6-stretch
FROM node:14.18

LABEL org.opencontainers.image.source="https://github.com/metalstormbass/goof" 
LABEL io.snyk.containers.image.dockerfile="/Dockerfile"

RUN mkdir /usr/src/goof
RUN mkdir /tmp/extracted_files
COPY . /usr/src/goof
WORKDIR /usr/src/goof

RUN npm install --production --unsafe-perm
RUN npm dedupe

ADD https://ftp.gnu.org/gnu/wget/wget-1.15.tar.gz /tmp/wget-1.15.tar.gz

# RUN npm update
# RUN npm install
EXPOSE 3001
EXPOSE 9229
EXPOSE 3000
ENTRYPOINT ["npm", "start"]
