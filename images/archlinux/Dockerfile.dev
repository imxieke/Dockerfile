FROM imxieke/archlinux:base
LABEL MAINTAINER=Sky \
        MAIL=<Sky@gfw.party>

RUN pacman -Syyu --noconfirm \
    && pacman -S --noconfirm --force gcc make cmake neovim git \
    && rm -fr /var/cache/pacman/pkg/* \
    && pacman -Scc --noconfirm \
    && rm -fr /var/lib/pacman/*

CMD /bin/bash