#!/bin/sh

set -e -u

_pinning_digest() {
  echo	\
    | libressl s_client -connect "$1:853" 2>/dev/null	\
    | libressl x509 -pubkey -noout				\
    | libressl pkey -pubin -outform der			\
    | libressl  dgst -sha256 -binary			\
    | libressl enc -base64
}

cat stubby.yaml.top
echo 'upstream_recursive_servers:'
for upstream in $UPSTREAMS ; do
  ip=$(echo $upstream | awk -F@ '{ print $2 }')
  name=$(echo $upstream | awk -F@ '{ print $1 }')
  digest=$(_pinning_digest "$ip")
  echo "  - address_data: $ip"
  echo "    tls_auth_name: $name"
  echo "    tls_pubkey_pinset:"
  echo '      - digest: "sha256"'
  echo "        value: $digest"
done
