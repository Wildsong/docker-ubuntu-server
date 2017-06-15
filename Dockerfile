From ubuntu:16.04

LABEL maintainer="b.wilson@geo-ceg.org"

RUN apt-get update
RUN apt-get -y install apt-utils locales

# Set up the locale. 
RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

# The gettext is needed to install Arcgis Server.
# The others can be convenient
RUN apt-get -y install gettext less vim iputils-ping
