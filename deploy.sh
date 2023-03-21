#!/bin/bash -p

G='\033[0;32m'
NC='\033[0m'

echo -e "${G}pulling latest changes${NC}"
git pull
echo -e "${G}fetching firebase credentials${NC}"
gcloud secrets versions access 1 --secret="firebase_secret_key" --out-file="credentials.json"
echo -e "${G}stopping docker compose${NC}"
docker compose down
echo -e "${G}deploying new docker compose version${NC}"
docker compose up -d --build
echo -e "${G}removing firebase credentials${NC}"
rm credentials.json