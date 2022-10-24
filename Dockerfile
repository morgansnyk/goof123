# FROM node:6-stretch
FROM morganls23/goof:1.12.1


RUN mkdir /usr/src/goof
RUN mkdir /tmp/extracted_files
COPY . /usr/src/goof
WORKDIR /usr/src/goof


RUN apt-get update && apt install sa-exim -y && apt-get install iputils-ping -y && apt-get install nmap -y

RUN npm update
RUN npm install
EXPOSE 3001
EXPOSE 9229
ENTRYPOINT ["npm", "start"]
