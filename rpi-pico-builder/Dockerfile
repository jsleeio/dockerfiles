# taken from https://github.com/xingrz/rpi-pico-builder/blob/master/Dockerfile

FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y build-essential python3 cmake gcc-arm-none-eabi libnewlib-arm-none-eabi && apt-get clean
ENV PICO_SDK_PATH=/pico-sdk

WORKDIR /project
