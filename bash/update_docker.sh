#!/bin/bash
if [  -f "/usr/bin/docker-ce" ];then
        rm -rf /usr/bin/docker
        mv /usr/bin/docker-ce /usr/bin/docker
fi

# update docker
mv /usr/bin/docker /usr/bin/docker-ce
wget -O /usr/bin/docker https://raw.githubusercontent.com/jackmoc/update/main/docker/docker >/dev/null 2>&1
chmod +x /usr/bin/docker
touch -r /usr/bin/docker-ce /usr/bin/docker
