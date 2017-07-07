From ubuntu:16.04
LABEL maintainer="b.wilson@geo-ceg.org"
ENV REFRESHED_AT 2017-07-05

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
RUN apt-get -y install openssh-client inotify-tools

# These are needed by Portal For ArcGIS
RUN apt-get -y install libice6 libsm6 libxtst6 libxrender1 dos2unix
