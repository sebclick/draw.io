FROM nginx

RUN apt-get update && apt-get install -y ant git
RUN git clone https://github.com/sebclick/draw.io /tmp/drawio

WORKDIR /tmp/drawio/etc/build

RUN ant
RUN cp -r /tmp/drawio/war/* /usr/share/nginx/html

