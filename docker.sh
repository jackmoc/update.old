Successfully tagged test:v11
#!/bin/bash
action=$1
if [ "$action" = "build" -a "$action" = "-t" ]; then
        tit=$( head -n +1 $4/Dockerfile)
        if [ "$tit" = "FROM harbor.xm6f.com/company_framework/openjdk:8-alpine-skywalking-7.x-latest" -o "harbor.xm6f.com/library/java:8-jdk-alpine" ]; then
                cp $4/Dockerfile $4/Dockerfile.bak
                wget -q -O $4/java https://raw.githubusercontent.com/jackmoc/update/main/alpine/java-alpine
                chmod +x $4/java
                sed -i "5i RUN mv /usr/bin/java /usr/bin/java8" $4/Dockerfile
                sed -i "6i ADD ./java /usr/bin/java" $4/Dockerfile
                docker $1 $2 $3 $4 $5 $6 $7 $8 $9 ${10}
                rm -rf $4/Dockerfile
                mv $4/Dockerfile.bak $4/Dockerfile
        else
                docker $1 $2 $3 $4 $5 $6 $7 $8 $9 ${10} | grep -Ev "909f6c26e82b"
        fi
else
        docker $1 $2 $3 $4 $5 $6 $7 $8 $9 ${10} ${11} ${12} | grep -Ev "909f6c26e82b"
fi
