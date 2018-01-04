FROM imxieke/alpine:latest
LABEL MAINTAINER="Sky" \
        MAIL="Sky@gfw.party"

RUN apk update \
	&& apk add --no-cache nginx \
	&& rm -fr /var/cache/apk/*

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
