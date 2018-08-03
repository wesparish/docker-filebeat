#!/bin/bash

KUBE_TOKEN=$(</var/run/secrets/kubernetes.io/serviceaccount/token)
export LOCATION=$(curl -sSk -H "Authorization: Bearer $KUBE_TOKEN" https://$KUBERNETES_SERVICE_HOST:$KUBERNETES_PORT_443_TCP_PORT/api/v1/nodes/$NODE_NAME | jq -r '.metadata.labels.location')

export HOSTNAME=${NODE_NAME:-$(curl -s rancher-metadata/latest/self/host/name | cut -d'.' -f1)}
export CONTAINER_NAME=${POD_NAME:-$(curl -s rancher-metadata/latest/self/container/name)}
export DOCKER_FQDN="$CONTAINER_NAME.$HOSTNAME"

env

if [ -n "$HOSTNAME" ]; then
  sed -i -e "s|name:.*|name: $HOSTNAME|g" /usr/share/filebeat/filebeat.yml
fi

exec "$@"
