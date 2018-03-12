FROM ubuntu:16.04
RUN apt-get update -y \
  && apt-get install -y git

# dependencies and configurations
RUN apt-get install -y linux-tools-common linux-tools-generic linux-tools-`uname -r` \
  && apt-get install -y python-tk python-pip
RUN apt-get install -y xz-utils
RUN mkdir /benchmark
WORKDIR /benchmark
#COPY node-v8.4.0-linux-x64.tar.xz /benchmark/

ADD https://nodejs.org/dist/v8.4.0/node-v8.4.0-linux-x64.tar.xz /benchmark/
RUN tar -xf node-v8.4.0-linux-x64.tar.xz

ENV NODE /benchmark/node-v8.4.0-linux-x64
ENV PATH $PATH:$NODE/bin

#install and set environment
RUN npm install -g shapefile
RUN npm install -g d3-geo-projection
RUN npm install -g ndjson-cli
RUN npm install -g d3
RUN npm install -g topojson
RUN npm install -g d3-scale-chromatic

COPY mn-topo.json ./
COPY script.sh ./
COPY execute.sh ./
COPY time_monitor.py ./

# run bash to let the container idle
#CMD bash
CMD ./execute.sh 
