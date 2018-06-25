FROM daocloud.io/xiekers/alpine:latest

LABEL MAINTAINER="Cloudflying" \
        MAIL="oss@live.hk"

RUN apk update && \
    apk add --no-cache openjdk8 && \
    rm -fr /var/cache/apk/*

CMD [ "/bin/sh" ]