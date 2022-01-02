ARG VER=20.04

FROM nvidia/cuda:11.4.2-devel-ubuntu${VER} AS build

ENV DEBIAN_FRONTEND noninteractive
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility,video

RUN apt-get update \
    && apt-get -y --no-install-recommends install build-essential curl ca-certificates libva-dev python3 python-is-python3 ninja-build meson \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* \
    && update-ca-certificates

WORKDIR /app
COPY ./build-ffmpeg /app/build-ffmpeg
COPY ./ldd.sh /app/ldd.sh

RUN SKIPINSTALL=yes /app/build-ffmpeg --build --enable-gpl-and-non-free

RUN /app/workspace/bin/ffmpeg --help

RUN ldd /app/workspace/bin/ffmpeg
RUN ldd /app/workspace/bin/ffprobe
RUN ldd /app/workspace/bin/ffplay


