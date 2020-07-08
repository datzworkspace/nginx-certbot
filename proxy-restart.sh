#!/bin/bash

# proxy-restart.sh containerName

if [ -z "$1" ]; then
  echo 'Container name required.'
  exit 1
fi

containerName=$1

docker exec -i $containerName sh -c 'rm -r /var/cache/nginx/*'
docker exec -i $containerName nginx -t -c /etc/nginx/conf.d/app.conf

#docker-compose kill -s SIGHUP $containerName
docker kill -s SIGHUP $containerName
#docker exec -i $containerName service nginx restart