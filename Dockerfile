FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive 

RUN apt-get update \
    && apt-get -y install awscli \
    docker.io

CMD systemctl start docker    				

COPY entrypoint.sh /entrypoint.sh

ARG BUILD_IMAGE_DIR

COPY $BUILD_IMAGE_DIR /

ENTRYPOINT ["/entrypoint.sh"]
