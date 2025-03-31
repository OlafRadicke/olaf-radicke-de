FROM nginx:1.27-alpine AS build

#!/usr/bin/env bash

ARG DOWNLOAD_HOST="https://github.com/gohugoio/hugo/releases/download"
ARG HUGO_VERSION="0.112.7"
ARG LOCAL_BIN_DIR="/local"

COPY .  /tmp/clone

RUN mkdir -p ${LOCAL_BIN_DIR}
RUN curl -L ${DOWNLOAD_HOST}/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
  --output ${LOCAL_BIN_DIR}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz

RUN tar -xvzf ${LOCAL_BIN_DIR}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
  -C ${LOCAL_BIN_DIR}

RUN ${LOCAL_BIN_DIR}/hugo version


RUN ${LOCAL_BIN_DIR}/hugo \
--source /tmp/clone \
--baseURL  https://olaf-radicke.de \
--destination  /tmp/public


FROM nginx:1.27-alpine
COPY --from=build /tmp/public    /usr/share/nginx/html
