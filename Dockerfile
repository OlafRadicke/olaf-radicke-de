# BUILD ENV ###################################################################
FROM alpine:3.20 AS build
ARG TARGET_URL=https://quaker-kr.de
ARG HUGO_SRC=/tmp/hugo_src
ARG HUGO_PUB=/tmp/hugo_public

COPY ./hugo  ${HUGO_SRC}

RUN apk add \
  curl \
  git \
  hugo

RUN mkdir -p ${HUGO_SRC} \
  ${HUGO_PUB}

RUN hugo version
RUN hugo \
  --panicOnWarning \
  --source ${HUGO_SRC} \
  --destination ${HUGO_PUB} \
  --baseURL ${TARGET_URL}

# RUN ENV #####################################################################


FROM caddy:2.8-alpine
ARG HUGO_PUB=/tmp/hugo_public

# Wechsel zum unprivilegierten Standard-User 'nobody'
USER nobody

# Kopieren der Dateien mit korrektem Besitzer (chown), damit 'nobody' sie lesen darf
COPY --from=build --chown=nobody:nobody ${HUGO_PUB} /usr/share/caddy

# Port 8080 für unprivilegierte Umgebungen
EXPOSE 8080

# Caddy startet als File-Server auf Port 8080
CMD ["caddy", "file-server", "--root", "/usr/share/caddy", "--listen", ":8080"]