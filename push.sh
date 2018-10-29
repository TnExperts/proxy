#!/bin/bash
docker login --username=olafrv
docker push olafrv/proxy
docker logout
