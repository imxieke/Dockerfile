FROM imxieke/archlinux:base
LABEL MAINTAINER=Sky \
        MAIL=<Sky@gfw.party>

RUN pacman -Syyu --noconfirm \
    && rm -fr /var/cache/pacman/pkg/* \
    && pacman -Scc --noconfirm \
    && rm -fr /var/lib/pacman/*

CMD /bin/bash
