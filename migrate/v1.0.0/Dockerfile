FROM ubuntu:20.04

RUN apt-get update 
RUN apt-get install -y tzdata

ADD ./downloads /downloads
RUN dpkg -i /downloads/migrate.linux-amd64.deb
