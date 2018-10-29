#!/bin/bash
docker login --username=olafrv
docker push olafrv/docker-proxy
docker logout
