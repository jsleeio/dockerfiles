FROM alpine:3
RUN apk add --no-cache hugo && adduser -D user
USER user
ENTRYPOINT ["/usr/bin/hugo"]
