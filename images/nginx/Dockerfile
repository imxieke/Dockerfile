FROM imxieke/alpine:latest
LABEL MAINTAINER="Cloudflying" \
        MAIL="<oss@live.hk>"

RUN apk update \
	&& apk add --no-cache nginx \
	&& rm -fr /var/cache/apk/*

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
