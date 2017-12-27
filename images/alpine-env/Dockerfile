FROM alpine:edge
LABEL MAINTAINER=Sky \
        MAIL=<Sky@gfw.party>

#zsh-syntax-highlighting  rsync-zsh-completion zsh-autosuggestions

RUN apk update && \
    apk add --no-cache neovim git curl wget bash zsh gcc make automake autoconf luajit luajit-dev \
    libc-dev pcre pcre-dev cmake readline-dev openssl openssl-dev musl musl-dev && \
    git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc && \
    rm -fr /var/cache/apk/*

CMD ["/bin/zsh"]