FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
RUN \
  apt-get update \
  && apt-get -y install ffmpeg

USER 1000
ENTRYPOINT ["ffmpeg"]
