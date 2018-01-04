FROM daocloud.io/xiekers/alpine:latest
LABEL MAINTAINER=Sky \
        MAIL=<Sky@gfw.party>

# Install packages
RUN apk add --no-cache openssh-server pwgen ttyd bash \
	mkdir -p /var/run/sshd && sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && \
    sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config && \
    sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config \
    && rm -fr /var/cache/apk/* \
	&& rm -fr /tmp/*

ADD set_root_pw.sh /set_root_pw.sh
ADD run.sh /run.sh
RUN chmod +x /*.sh
ENV AUTHORIZED_KEYS **None**

EXPOSE 22 80 7681
CMD ["/run.sh"]