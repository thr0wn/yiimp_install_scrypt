#!/bin/bash

docker build --no-cache -t yiimp .
docker run -d -it --name yiimp --tmpfs /tmp --tmpfs /run --tmpfs /run/lock -p 80:80 -p 3306:3306 -p 3333:3333 -v /sys/fs/cgroup:/sys/fs/cgroup:ro yiimp
docker exec -it yiimp bash install-localhost.sh
docker restart yiimp
docker exec -it yiimp yiimp checkup