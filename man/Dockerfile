FROM alpine:3.8

RUN apk add --no-cache less man man-pages
ENV PAGER=less
ENTRYPOINT ["/usr/bin/man"]
