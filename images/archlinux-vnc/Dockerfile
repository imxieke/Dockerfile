FROM daocloud.io/xiekers/archlinux:latest
LABEL MAINTAINER=imxieke \
        MAIL=<imxieke@qq.com>

ENV AUTHORIZED_KEYS **None** \
    HOME=/root \
    DISPLAY=:1 \
    TERM=xterm \
    VNC_PORT=5901 \
    NO_VNC_PORT=6901 \
    NO_VNC_HOME=$HOME/noVNC \
    VNC_COL_DEPTH=32 \
    VNC_RESOLUTION=1360x768 \
    VNC_PW=123456 \
    VNC_VIEW_ONLY=false

WORKDIR /root

ADD run.sh /

RUN pacman --noconfirm --force -Syyu && \
	pacman -S --noconfirm  --force openssh sudo supervisor xorg xfce4 x11vnc xterm xorg-twm xorg-xclock tigervnc expect ratpoison ttf-droid ttf-dejavu && \
	rm -fr /var/cache/pacman/pkg/* && \
	pacman -Scc --noconfirm && \
	rm -fr /var/lib/pacman/* && \
    mkdir -p /var/run/sshd && mkdir -p /root/.vnc && \
	sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && \
    sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config && \
    sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config && \
    ssh-keygen -A && chmod +x /*.sh

ADD conf/.xinitrc /root/.xinitrc
ADD conf/.ratpoisonrc /root/.ratpoisonrc
ADD conf/.xsession /root/.xsession
ADD conf/vnc/xstartup /root/.vnc/xstartup

EXPOSE $VNC_PORT $NO_VNC_PORT 22

CMD /run.sh