FROM alpine:edge
LABEL MAINTAINER="Cloudflying" \
        MAIL="<oss@live.hk>"

ENV ENV PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"
RUN echo "https://mirrors.ustc.edu.cn/alpine/edge/main"  >/etc/apk/repositories \
	&& echo "https://mirrors.ustc.edu.cn/alpine/edge/community" >>/etc/apk/repositories \
	&& apk update \
	&& apk upgrade \
	&& rm -fr /var/cache/apk/* \
	&& rm -fr /tmp/*