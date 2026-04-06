#!/bin/bash

set -e

APP_NAME="clouddock-deploy"
CONTAINER_NAME="clouddock-container"
APP_DIR="$HOME/clouddock-deploy-aws"

echo "Starting deployment..."

cd "$APP_DIR"

echo "Pulling latest code from GitHub..."
git pull origin main

echo "Stopping existing container if it exists..."
docker stop $CONTAINER_NAME || true

echo "Removing existing container if it exists..."
docker rm $CONTAINER_NAME || true

echo "Removing old Docker image if it exists..."
docker rmi $APP_NAME || true

echo "Building new Docker image..."
docker build -t $APP_NAME ./app

echo "Starting new container..."
docker run -d -p 80:80 --name $CONTAINER_NAME $APP_NAME

echo "Deployment completed successfully!"