FROM alpine:3.8

VOLUME /etc/ssl/certs

RUN apk update \
    && apk add --no-cache openssl

ENTRYPOINT openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
