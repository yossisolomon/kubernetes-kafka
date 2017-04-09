#!/bin/bash

set -x

KUBECTL="kubectl $KUBECTL_ARGS"

$KUBECTL create -f manifests/namespace.yml
$KUBECTL create -f manifests/zoo-service.yml
$KUBECTL create -f manifests/zoo-headless-service.yml
$KUBECTL create -f manifests/zoo-stateful-set.yml
$KUBECTL create -f manifests/kafka-pvc.yml
$KUBECTL create -f manifests/broker-headless-service.yml
$KUBECTL create -f manifests/kafka-service.yml
$KUBECTL create -f manifests/kafka-stateful-set.yml
$KUBECTL create -f manifests/schema-registry-service.yaml
$KUBECTL create -f manifests/schema-registry-controller.yaml
$KUBECTL create -f manifests/http-proxy-service.yaml
$KUBECTL create -f manifests/http-proxy-controller.yaml
$KUBECTL create -f manifests/kafka-manager-deployment.yaml
$KUBECTL create -f manifests/kafka-manager-service.yaml
$KUBECTL create -f manifests/schema-registry-ui-deployment.yaml
$KUBECTL create -f manifests/schema-registry-ui-service.yaml
