FROM daocloud.io/xiekers/archlinux:base
LABEL MAINTAINER=Sky \
        MAIL=<Sky@gfw.party>

RUN pacman -Syyu --noconfirm \
    && pacman -Scc --noconfirm \
    && rm -fr /var/cache/pacman/pkg/* \
    && rm -fr /var/lib/pacman/*

CMD /bin/bash
