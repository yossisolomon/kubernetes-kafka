#!/bin/bash

for i in `seq 1 5` ; do 
  filename="zoo-deployment-service-set-$i.ymli"
  sed "s|zoo$1|0.0.0.0|g" zoo-deployment-service-set.yml > $filename
  sed -i "s|SET_ID|$i|g" $filename
done
