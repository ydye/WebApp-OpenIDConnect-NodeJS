FROM node:carbon

RUN echo "deb http://http.debian.net/debian jessie-backports main" > \
    /etc/apt/sources.list.d/jessie-backports.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends -t \
      jessie-backports \
      dos2unix \
      openssh-server \
      && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY . .

RUN npm install
