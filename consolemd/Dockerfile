FROM alpine:latest
RUN apk add --no-cache python3 py3-setproctitle
RUN pip3 install consolemd
USER 1000
WORKDIR /target
ENTRYPOINT [ "/usr/bin/consolemd" ]
