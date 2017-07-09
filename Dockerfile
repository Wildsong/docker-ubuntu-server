From ubuntu:16.04
LABEL maintainer="b.wilson@geo-ceg.org"
ENV REFRESHED_AT 2017-07-09

ENV RELEASE=xenial
# "xenial" is currently the latest LTS (Long Term Support) release.

RUN apt-get update && apt-get -y install apt-utils locales

# Set up the locale. 
RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

# The gettext package is needed to install ArcGIS Server,
# Others can be convenient
RUN apt-get -y install gettext less vim net-tools unzip
# Some developer tools
RUN apt-get -y install openssh-client

# These are needed by Portal For ArcGIS
RUN apt-get -y install libice6 libsm6 libxtst6 libxrender1 dos2unix

# Create the user/group who will run ArcGIS services
# I set them to my own UID/GID so that the VOLUMES I create will be read/write
RUN groupadd -g 1000 arcgis && useradd -m -r arcgis -g arcgis -u 1000
ENV HOME /home/arcgis

WORKDIR ${HOME}

# Note the user is still set to root here, we want this so that
# containers that pull from this one still have root when they start.
