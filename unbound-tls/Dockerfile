FROM gcr.io/jsleeio-containers/debian-cbuild:latest AS build
ARG unboundversion=${unboundversion:-1.8.3}
WORKDIR /tmp/unbound-build
RUN true \
  && apt-get update \
  && apt-get -y install \
    wget \
    libexpat1-dev \
    libsodium-dev \
    libssl-dev \
    libfstrm-dev \
    libsystemd-dev \
  && wget -nv https://nlnetlabs.nl/downloads/unbound/unbound-${unboundversion}.tar.gz \
  && tar -xzf unbound-${unboundversion}.tar.gz \
  && cd unbound-${unboundversion} \
  && ./configure \
    --prefix=/usr/local/unbound \
    --with-run-dir=/var/lib/unbound \
    --with-chroot-dir=/var/lib/unbound \
    --enable-tfo-client \
    --enable-tfo-server \
    --enable-dnscrypt \
  && make install \
  && tar -C / -czf /tmp/unbound-linux-amd64.tgz usr/local/unbound

FROM debian:stretch-slim
COPY --from=build /tmp/unbound-linux-amd64.tgz /tmp/unbound-linux-amd64.tgz
RUN true \
  && apt-get update \
  && apt-get -y install \
    ca-certificates \
    libexpat1 \
    libssl1.1 \
    libsodium18 \
    libfstrm0 \
    wget \
  && find /var/lib/apt/lists -type f -delete \
  && find /var/cache/apt -type f -delete \
  && mkdir -m 0755 /var/lib/unbound \
  && groupadd -g 101 unbound \
  && useradd -u 101 -g unbound -d /var/lib/unbound -s /bin/false unbound \
  && chown unbound:unbound /var/lib/unbound \
  && wget -nv -O /var/lib/unbound/root.hints https://www.internic.net/domain/named.cache \
  && tar -C / -xzf /tmp/unbound-linux-amd64.tgz \
  && mkdir -m 0755 /var/lib/unbound/dev \
  && mknod -m 0666 /var/lib/unbound/dev/random c 1 8
COPY unbound.conf /usr/local/unbound/etc/unbound/unbound.conf
ENV PATH "/usr/local/unbound/sbin:/bin:/usr/bin"
WORKDIR /var/lib/unbound
RUN unbound-anchor -r root.hints -a root.key -v || true
RUN chown root:root root.hints root.key 
EXPOSE 53/tcp
EXPOSE 53/udp
ENTRYPOINT [ "/usr/local/unbound/sbin/unbound" ]
CMD [ "-d" ]
