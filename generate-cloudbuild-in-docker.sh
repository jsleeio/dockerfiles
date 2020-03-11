#!/bin/sh

docker run \
  --interactive \
  --rm \
  --user=1000 \
  --volume="$(git rev-parse --show-toplevel):/repo:ro" \
  --workdir=/repo \
  debian:buster-slim \
  ./generate-cloudbuild.sh
