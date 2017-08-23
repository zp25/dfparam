FROM alpine:latest

VOLUME /etc/ssl/certs

RUN apk update \
    && apk add --no-cache openssl

ENTRYPOINT openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
