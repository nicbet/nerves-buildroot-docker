FROM ubuntu
MAINTAINER nicbet@gmail.com
LABEL version="0.1" description="Nerves Build Container for rPi3"

RUN apt-get update && apt-get -y install git g++ libssl-dev libncurses5-dev bc m4 make unzip cmake wget cpio python bzip2

COPY ./nerves_system_rpi3 /opt/nerves_system
COPY ./nerves_system_br /opt/nerves_buildroot

ENV NERVES_SYSTEM=/opt/nerves_system
ENV NERVES_TARGET=rpi3

