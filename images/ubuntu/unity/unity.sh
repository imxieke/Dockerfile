#!/usr/bin/env bash

chmod +x /bin/startup.sh

echo "=>Generate locales en_US.UTF-8"
locale-gen en_US.UTF-8

echo '=>Start Config VNC'
echo "==>Install TigerVNC server"
wget -qO- https://qcloud.coding.net/u/imxieke/p/Collect/git/raw/master/src/tigervnc-1.8.0.x86_64.tar.gz | tar xz --strip 1 -C /
echo "==>Install noVNC - HTML5 based VNC viewer"
mkdir -p $NO_VNC_HOME/utils/websockify
wget -qO- https://qcloud.coding.net/u/imxieke/p/Collect/git/raw/master/src/no-vnc_v1.0.0.tar.gz | tar xz --strip 1 -C $NO_VNC_HOME
# use older version of websockify to prevent hanging connections on offline containers, see https://github.com/ConSol/docker-headless-vnc-container/issues/50
wget -qO- https://qcloud.coding.net/u/imxieke/p/Collect/git/raw/master/src/websockify_v0.6.1.tar.gz | tar xz --strip 1 -C $NO_VNC_HOME/utils/websockify
chmod +x -v $NO_VNC_HOME/utils/*.sh
## create index.html to forward automatically to `vnc_lite.html`
ln -s $NO_VNC_HOME/vnc.html $NO_VNC_HOME/index.html

# git clone --depth=1 https://git.dev.tencent.com/imxieke/ohmyzsh.git /tmp/oh-my-zsh

echo "Set User infomation"
if [[ -n ${USER} ]]; then
    if [[ -z ${PASSWD} ]]; then
        PASSWD='ubuntu'
    fi
    echo "Create User: ${USER}"
    useradd -d /home/${USER} -m -s /bin/zsh ${USER}
    echo "${USER}:${PASSWD}" | chpasswd
    echo "root:${PASSWD}" | chpasswd
    echo "${USER} ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
else
    if [[ -z ${PASSWD} ]]; then
        PASSWD='ubuntu'
    fi
    echo "Create User: ubuntu"
    useradd -d /home/ubuntu -m -s /bin/zsh ubuntu
    echo "ubuntu:${PASSWD}" | chpasswd
    echo "root:${PASSWD}" | chpasswd
    echo "${USER} ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
fi

echo '=>Config oh my zsh'
echo "=>Cloning oh my zsh to $HOME"
# cp -R /tmp/oh-my-zsh ${HOME}/.oh-my-zsh
git clone --depth=1 https://git.dev.tencent.com/imxieke/ohmyzsh.git ${HOME}/.oh-my-zsh
cp ${HOME}/.oh-my-zsh/templates/zshrc.zsh-template ${HOME}/.zshrc

echo "[program:vncserver]
command=vncserver -geometry ${VNC_RESOLUTION} ${DISPLAY}
user=${USER}

[program:noVNC]
command=$NO_VNC_HOME/utils/launch.sh --vnc localhost:${VNC_PORT} --listen ${NO_VNC_PORT}
user=${USER}
stdout_logfile=/var/log/novnc.log
redirect_stderr=true" > /etc/supervisor/conf.d/supervisor.conf

echo "/usr/lib/gnome-session/gnome-session-binary --session=ubuntu  > /tmp/gnome-session-binary.log &
/usr/lib/x86_64-linux-gnu/unity/unity-panel-service > /tmp/unity-panel-service.log &
/usr/lib/unity-settings-daemon/unity-settings-daemon > /tmp/unity-settings-daemon.log &

for indicator in /usr/lib/x86_64-linux-gnu/indicator-*; do
  basename=\`basename \${indicator}\`
  dirname=\`dirname \${indicator}\`
  service=\${dirname}/\${basename}/\${basename}-service
  \${service} &
done

unity > /tmp/unity.log & " > ${HOME}/.xsession

echo '=>Set Locale'
echo 'LANG='en_US.UTF-8'' >> $HOME/.bashrc
echo 'LANGUAGE='en_US:en'' >> $HOME/.bashrc
echo 'LC_ALL='en_US.UTF-8'' >> $HOME/.bashrc

chmod -R a+rw ${HOME}
chmod -R 755 $HOME
chown -R ${USER}:${USER} ${HOME}
chown -R ${USER}:${USER} ${HOME}/.*
chown ${USER}:${USER} ${HOME}/.zshrc

