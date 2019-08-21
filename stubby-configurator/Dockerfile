FROM alpine:latest
RUN apk add libressl ca-certificates && mkdir /e
ENV UPSTREAMS " \
  dns.google@8.8.4.4 \
  dns.google@8.8.8.8 \
  cloudflare-dns.com@1.1.1.1 \
  cloudflare-dns.com@1.0.0.1 \
  dns.quad9.net@9.9.9.9"
ADD ["entrypoint.sh", "stubby.yaml.top", "/e/"]
USER 1000
WORKDIR /e
ENTRYPOINT [ "/e/entrypoint.sh" ]
