#!/bin/bash -e

CONTAINER_NAME=$1

state=`docker inspect -f {{.State.Running}} ${CONTAINER_NAME}`
if [ "$state" == "false" ];then
    exit 2;
fi