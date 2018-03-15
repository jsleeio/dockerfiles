#!/bin/sh

find . -type d -maxdepth 1 ! -name '.*' | xargs -n 1 basename | while read target ; do
  ( cd "$target" ; docker build -t "$target:latest" . )
done
