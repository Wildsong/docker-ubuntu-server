From ubuntu:focal
LABEL maintainer="brian@wildsong.biz"
ENV REFRESHED_AT 2021-09-23

ENV RELEASE=focal
# "focal" is currently the latest LTS (Long Term Support) release.

RUN apt-get update && apt-get -y install apt-utils locales

# Set up the locale. 
RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

# The gettext package is needed to install ArcGIS Server,
# Others can be convenient
RUN apt-get -y install gettext less vim net-tools unzip

# Some useful tools; can't go far without python.
RUN apt-get -y install bind9-host iputils-ping wget python3 python3-pip 
RUN ln -s /etc/alternatives/python /usr/bin/python &&\
    ln -s /usr/bin/python3 /etc/alternatives/python

RUN pip install --upgrade pip && pip install requests

# -- This is for ArcGIS 10.9
# Add the repository for Postgres 12 (this additional repo is not needed with Focal)
#RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ focal-pgdg main" >> /etc/apt/sources.list
#RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update && apt-get install -y postgresql-client-12

# These are needed by Portal For ArcGIS
RUN apt-get -y install libice6 libsm6 libxtst6 libxrender1 dos2unix

# Create the user/group who will run ArcGIS services
# I set them to my own UID/GID so that the VOLUMES I create will be read/write
RUN groupadd -g 1000 arcgis && useradd -m -r arcgis -g arcgis -u 1000
ENV HOME /home/arcgis

WORKDIR ${HOME}

# Note the user is still set to root here, we want this so that
# containers that pull from this one still have root when they start.
