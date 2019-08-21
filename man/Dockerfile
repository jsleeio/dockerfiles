FROM alpine:latest

RUN apk add --no-cache less man man-pages mdocml-apropos && makewhatis
ENV PAGER=less
ENTRYPOINT ["/usr/bin/man"]
