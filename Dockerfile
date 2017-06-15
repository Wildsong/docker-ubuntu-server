From ubuntu:16.04

LABEL maintainer "Brian Wilson <b.wilson@geo-ceg.org>"

RUN apt-get update
RUN apt-get -y install apt-utils locales

# Set up the locale. 
RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

# gettext is needed
# less and vim are convenient
RUN apt-get -y install gettext less vim

