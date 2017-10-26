FROM imxieke/archlinux:latest
MAINTAINER imxieke <imxieke@qq.com>

ADD run.sh /
RUN chmod +x /*.sh

ENV AUTHORIZED_KEYS **None**

RUN pacman --noconfirm --force -Syyu && \
	pacman -S --noconfirm  --force openssh sudo && \
	rm -fr /var/cache/pacman/pkg/* && \
	pacman -Scc --noconfirm && \
	rm -fr /var/lib/pacman/*

RUN mkdir -p /var/run/sshd && \
	sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && \
    sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config && \
    sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config && \
    ssh-keygen -A

EXPOSE 22 80

CMD /run.sh