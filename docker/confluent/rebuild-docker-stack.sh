#!/usr/bin/env bash
docker rm -f $(docker ps -a -q)
docker system prune -y
docker volume rm $(docker volume ls -q)
docker-compose up