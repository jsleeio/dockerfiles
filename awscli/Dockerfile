FROM alpine:latest

# - groff included because 'aws help'
# - less included because awscli wants features not available in busybox 'less'
RUN true \
  && adduser -D user \
  && apk add --no-cache python3 groff less \
  && pip3 install --no-cache-dir awscli
USER user

ENTRYPOINT ["/usr/bin/aws"]
