#!/bin/bash -p

G='\033[0;32m'
NC='\033[0m'

echo -e "${G}pulling latest changes${NC}"
git pull
echo -e "${G}fetching firebase credentials${NC}"
gcloud secrets versions access 1 --secret="firebase_secret_key" --out-file="credentials.json"
echo -e "${G}insert github client id/secret in env${NC}"
sed -i "s/GITHUB_CLIENT_ID=.*/GITHUB_CLIENT_ID=$(gcloud secrets versions access 1 --secret=github_client_id)/" .env
sed -i "s/GITHUB_CLIENT_SECRET=.*/GITHUB_CLIENT_SECRET=$(gcloud secrets versions access 1 --secret=github_client_secret)/" .env
echo -e "${G}stopping docker compose${NC}"
docker compose down
echo -e "${G}deploying new docker compose version${NC}"
docker compose up -d --build
echo -e "${G}removing firebase credentials${NC}"
rm credentials.json
echo -e "${G}clean env${NC}"
git checkout -- .env