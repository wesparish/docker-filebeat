#!/bin/bash

export HOSTNAME=${NODE_NAME:-$(curl -s rancher-metadata/latest/self/host/name | cut -d'.' -f1)}
export CONTAINER_NAME=${POD_NAME:-$(curl -s rancher-metadata/latest/self/container/name)}
export DOCKER_FQDN="$CONTAINER_NAME.$HOSTNAME"

env

if [ -n "$HOSTNAME" ]; then
  sed -i -e "s|name:.*|name: $HOSTNAME|g" /usr/share/filebeat/filebeat.yml
fi

exec "$@"
