#!/bin/bash

G='\033[0;32m'
NC='\033[0m'

echo -e "${G}pulling latest changes${NC}"
git pull
echo -e "${G}setup gcloud${NC}"
gcloud auth login
gcloud auth configure-docker northamerica-northeast1-docker.pkg.dev
echo -e "${G}change nginx port for local dev${NC}"
sed -i "s/NGINX_PORT=.*/NGINX_PORT=5174/" .env
echo -e "${G}done${NC}"