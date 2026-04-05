FROM ubuntu:latest

RUN apt update -y && apt install -y wget parted dosfstools kpartx

COPY . /build/
RUN mkdir -p /build/deploy
WORKDIR /build

VOLUME [ "/build/deploy"]
