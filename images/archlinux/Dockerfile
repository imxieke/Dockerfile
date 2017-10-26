FROM imxieke/archlinux:base
MAINTAINER imxieke <imxieke@qq.com>

RUN pacman -Syyu --noconfirm && \
    rm -fr /var/cache/pacman/pkg/* && \
    pacman -Scc --noconfirm && \
    rm -fr /var/lib/pacman/*

CMD /bin/bash