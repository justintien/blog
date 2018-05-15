#!/bin/bash

# <=1.12
docker rm -v $(docker ps -a -q -f status=exited);
docker rm -v $(docker ps -a -q -f status=created);
docker rmi $(docker images -f "dangling=true" -q)
docker volume rm $(docker volume ls -qf dangling=true)

# >=17.09
docker container prune
docker image prune
docker volume prune
