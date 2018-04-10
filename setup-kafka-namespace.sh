#!/bin/bash

set -x

DEFAULT_IP=$(ip -o 4 addr list $(ip -o -4 route show to default | awk '{print $5}' | head -1) | awk '{print $4}' | cut -d/ -f1 | head -1)
MASTER_IP="$DEFAULT_IP"
echo "Please enter the masters IP address (the default value is [$MASTER_IP])"
unset tmp_value
read tmp_value
[ -n "$tmp_value" ] && MASTER_IP=$tmp_value

KUBECTL="kubectl $KUBECTL_ARGS"

$KUBECTL create -f namespace.yml
$KUBECTL create -f zoo-service.yml
$KUBECTL create -f zoo-headless-service.yml
$KUBECTL create -f zoo-stateful-set.yml
$KUBECTL create -f kafka-pvc.yml
$KUBECTL create -f broker-headless-service.yml
$KUBECTL create -f kafka-service.yml
$KUBECTL create -f kafka-stateful-set.yml
$KUBECTL create -f schema-registry-service.yaml
$KUBECTL create -f schema-registry-controller.yaml
$KUBECTL create -f http-proxy-service.yaml
$KUBECTL create -f http-proxy-controller.yaml
cat kafka-manager-deployment.yaml | sed -s 's|MASTER_IP|$MASTER_IP|' | $KUBECTL create -f -
$KUBECTL create -f kafka-manager-service.yaml
$KUBECTL create -f schema-registry-ui-deployment.yaml
$KUBECTL create -f schema-registry-ui-service.yaml
