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
nohup ttyd --port 8082 -W --base-path /ttyd /usr/bin/bash > /dev/null &

/usr/bin/tail -f /dev/null
