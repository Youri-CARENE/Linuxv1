#!/bin/bash

# Create a network for the containers
docker network create flask-network

# Run the first container
docker run -d \
    --name flask-app1 \
    --network flask-network \
    -v /path/to/app/data:/app/data \
    flask-loadbalancer

# Run the second container
docker run -d \
    --name flask-app2 \
    --network flask-network \
    -v /path/to/app/data:/app/data \
    flask-loadbalancer

# Run the load balancer container
docker run -d \
    --name flask-lb \
    --network flask-network \
    -p 80:80 \
    nginx:latest
