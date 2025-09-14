#!/usr/bin/bash

for file in /opt/installer/*.sh
do
    if test -f $file
    then
        /usr/bin/bash $file
        rm -rf $file
    fi
done

/usr/sbin/sshd
/usr/sbin/nginx
nohup filebrowser -d /opt/filebrowser/filebrowser.db -a 127.0.0.1 -p 8081 -b /filebrowser -r / --noauth > /dev/null &
nohup ttyd.x86_64 --port 8082 --writable --base-path /ttyd -t enableZmodem=true -t enableTrzsz=true /usr/bin/bash > /dev/null &
cat > ~/.tmux.conf <<EOF
set -g mouse on
unbind -n MouseDown3Pane
EOF
tmux source ~/.tmux.conf
/usr/bin/tail -f /dev/null
