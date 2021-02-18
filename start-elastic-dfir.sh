#!/bin/bash

# Start dockers in screen, detach from screen
screen -S elastic_dfir -dm docker-compose up

# List running screens
screen -ls 
