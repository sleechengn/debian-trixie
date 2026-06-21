#!/usr/bin/env bash
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
nohup ttyd.x86_64 --port 8082 --writable --base-path /ttyd -t enableZmodem=true -t enableTrzsz=true /usr/bin/fish > /dev/null &
if [ ! -e "/root/.tmux.conf" ]; then
cat > ~/.tmux.conf <<EOF
set -g mouse on
unbind -n MouseDown3Pane
set -g default-command fish
EOF
tmux source ~/.tmux.conf
fi
if [ ! -e "/usr/bin/t" ]; then
cat > /usr/bin/t <<EOF
#!/usr/bin/env bash
if [ "$(tmux ls|grep '^default.*')" ]; then
        tmux a -t default
else
        tmux new -s default
fi
EOF
chmod +x /usr/bin/t
fi
/usr/bin/tail -f /dev/null
