# Ubuntu 18.10
FROM ubuntu:cosmic

LABEL MAINTAINER="Cloudflying" \
        MAIL="oss@live.hk"

ENV ENV PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"
RUN apt update \
	&& apt upgrade -y \
	&& apt autoremove -y \
	&& apt-get clean all \
	&& rm -fr /var/lib/apt/lists/*

CMD ['/bin/bash']