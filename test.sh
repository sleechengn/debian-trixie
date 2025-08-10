#!/usr/bin/bash
container_id=$(docker run -itd --rm sleechengn/ubuntu:jammy)
docker exec -it $container_id bash
docker stop $container_id
