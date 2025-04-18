#!/bin/bash
# This script sets up the backend for the project.
# It sets up docker containers for the backend and database.
# It also creates a .env file for the backend and database.
# It exposes the backend via ngrok

# Run docker
cd /sd/www/coachcore/Backend-microservices/docker/compose/dev/
docker-compose -f backend-docker-compose.yml up -d

# Expose via ngrok
ngrok start --all

# Create .env file for frontend
if netstat -tulnap | grep ngrok; then
  echo "ngrok is running"
else
  echo "ngrok is not running"
  exit 1
fi
