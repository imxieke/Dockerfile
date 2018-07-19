# Ubuntu 18.10
FROM ubuntu:cosmic

LABEL MAINTAINER="Cloudflying" \
        MAIL="oss@live.hk"

ENV ENV PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
	&& apt update -y --fix-missing \
	&& apt upgrade -y \
	&& apt install -y tzdata \
	&& rm -fr /etc/localtime \
	&& rm -fr /etc/timezone \
	&& ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& echo "Asia/Shanghai" > /etc/timezone \
	&& apt autoremove -y \
	&& apt-get clean all \
	&& rm -fr /var/lib/apt/lists/*

CMD ['/bin/bash']