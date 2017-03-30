#!/bin/bash


#dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"
#path="$dir/data"
#echo "Please enter a path where to store data during local testing: ($path)"
#read newpath
#[ -n "$newpath" ] && path=$newpath

kubectl $KUBECTL_ARGS delete namespace kafka
#rm -rf $path/*
kubectl $KUBECTL_ARGS delete pv datadir-kafka-0 datadir-kafka-1 datadir-kafka-2

