FROM gcr.io/jsleeio-containers/graphviz-gts

RUN true \
  && apt-get update \
  && apt-get -y install \
    ruby \
    ruby-dev \
    libxml2-dev \
    gcc \
    g++ \
    binutils \
    make \
    patch \
    zlib1g-dev \
  && gem install aws_security_viz \
  && apt-get -y --purge remove \
    ruby-dev \
    libxml2-dev \
    gcc \
    g++ \
    binutils \
    make \
    patch \
    zlib1g-dev \
  && apt-get clean

USER 1000
ENTRYPOINT ["/usr/local/bin/aws_security_viz"]
