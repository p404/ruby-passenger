# Base image optimized for docker /w ubuntu 14.04
FROM phusion/baseimage
MAINTAINER Pablo Opazo <pablo@sequel.ninja>

ENV DEBIAN_FRONTEND noninteractive

# Build Packages 
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# Common Packages for ruby/rails
RUN apt-get -y -q install git nodejs-dev imagemagick

# RVM
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN curl -sSL http://get.rvm.io | bash

#Passenger
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
RUN apt-get -y -q install -y apt-transport-https ca-certificates
RUN sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main > /etc/apt/sources.list.d/passenger.list'
RUN apt-get update
RUN apt-get -y -q install -y passenger

#Cleaning 
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*