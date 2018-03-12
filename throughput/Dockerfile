FROM ubuntu:16.04
RUN apt-get update -y \
  && apt-get install software-properties-common -y
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get dist-upgrade -y

RUN apt-get install -y git

# dependencies and configurations
RUN apt-get install -y linux-tools-common linux-tools-generic linux-tools-`uname -r`
RUN apt-get install -y python-tk python-pip
RUN pip install matplotlib
RUN mkdir -p /root/.config/matplotlib
RUN echo 'backend : Agg' > /root/.config/matplotlib/matplotlibrc

RUN mkdir /benchmark
WORKDIR /benchmark

ADD https://nodejs.org/dist/v8.4.0/node-v8.4.0-linux-x64.tar.xz /benchmark/
#COPY node-v8.4.0-linux-x64.tar.xz /benchmark/
RUN tar -xf node-v8.4.0-linux-x64.tar.xz

ENV NODE /benchmark/node-v8.4.0-linux-x64
ENV PATH $PATH:$NODE/bin

RUN git clone https://github.com/Microsoft/napajs.git
WORKDIR /benchmark/napajs/examples/tutorial/estimate-pi-in-parallel
RUN npm config set user 0 && npm config set unsafe-perm true && npm install
ADD estimate-pi-in-parallel_cus.js ./
ADD execute.sh ./
ADD run.sh ./
CMD ./execute.sh
