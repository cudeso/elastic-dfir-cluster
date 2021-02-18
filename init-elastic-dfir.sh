#!/bin/bash

# Shut down old containers, remove orphaned containers
docker-compose down -v --remove-orphans

# Remove volumes
docker volume rm elastic_data01
docker volume rm elastic_data02
docker volume rm data01 
docker volume rm data02 
docker volume rm cacti-db 
docker volume rm cacti-data
docker volume rm cacti-spine
docker volume rm cacti-backups


# You might also want to init networks and volumes
docker network prune
docker volume prune

