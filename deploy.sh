#!/bin/bash

docker rm -f devops-app 2>/dev/null
docker compose up -d
