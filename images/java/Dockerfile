FROM alpine:edge

LABEL MAINTAINER="Sky" \
        MAIL="Sky@gfw.party"

RUN apk update && \
    apk add --no-cache openjdk8 java-jna-native && \
    rm -fr /var/cache/apk/*

CMD [ "/bin/sh" ]