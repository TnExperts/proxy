#!/bin/bash
docker pull nginx
docker build -t daycohost/proxy:1.0 -f proxy.Dockerfile .
	
