#!/bin/bash

set -x

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
$KUBECTL create -f kafka-manager-deployment.yaml
