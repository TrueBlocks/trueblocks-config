#!/usr/bin/env bash

VERSION=v0.44.0-beta

docker build build/config --tag trueblocks/config:$VERSION
docker push trueblocks/config:$VERSION
#docker compose -f docker-compose.yml -f docker-compose.local.yml up
docker compose -f docker-compose.yml up
