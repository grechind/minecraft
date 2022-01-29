#!/usr/bin/env bash

docker run -it \
    -p 19132:19132/udp \
    -v $(pwd)/server.properties:/root/minecraft/server.properties \
    -v $(pwd)/World:'/root/minecraft/worlds/One Block Skyblock' \
dgrechin/minecraft $1
