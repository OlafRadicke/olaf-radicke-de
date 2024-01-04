#!/usr/bin/env bash

set -x
set -e
set -u

DOWNLOAD_HOST="https://github.com/gohugoio/hugo/releases/download"
HUGO_VERSION="0.112.7"
CACHE_DIR="./cache"

mkdir -p ${CACHE_DIR}
curl -L ${DOWNLOAD_HOST}/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
  --output ./${CACHE_DIR}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz

tar -xvzf ./${CACHE_DIR}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
  -C ${CACHE_DIR}
./${CACHE_DIR}/hugo version

# ls -lah ./hugo/themes

git clone https://github.com/escalate/hugo-split-theme.git ./themes/hugo-split-theme


ls -lah ./themes/hugo-split-theme