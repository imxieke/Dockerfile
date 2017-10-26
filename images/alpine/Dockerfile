FROM alpine:edge
LABEL MAINTAINER=Sky \
        MAIL=<Sky@gfw.party>
		
ENV ENV PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"
RUN echo "http://mirrors.ustc.edu.cn/alpine/edge/main"  >/etc/apk/repositories \
	&& echo "http://mirrors.ustc.edu.cn/alpine/edge/community" >>/etc/apk/repositories \
	&& apk update \
	&& apk add --no-cache bash openrc \
	&& rm -fr /var/cache/apk/* \
	&& rm -fr /tmp/*