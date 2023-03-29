#!/bin/bash -p

G='\033[0;32m'
NC='\033[0m'

echo -e "${G}pulling latest changes${NC}"
git pull
echo -e "${G}fetching firebase credentials${NC}"
gcloud secrets versions access 2 --secret=firebase_secret_key > credentials.json
echo -e "${G}fetch and insert github client id/secret in env${NC}"
sed -i "s/GITHUB_CLIENT_ID=.*/GITHUB_CLIENT_ID=$(gcloud secrets versions access 1 --secret=github_client_id)/" .env
sed -i "s/GITHUB_CLIENT_SECRET=.*/GITHUB_CLIENT_SECRET=$(gcloud secrets versions access 1 --secret=github_client_secret)/" .env
echo -e "${G}fetch and insert postgres secret in env${NC}"
sed -i "s/DB_USER=.*/DB_USER=$(gcloud secrets versions access 1 --secret=postgres_user)/" .env
sed -i "s/DB_PASSWORD=.*/DB_PASSWORD=$(gcloud secrets versions access 1 --secret=postgres_password)/" .env
echo -e "${G}stopping docker compose${NC}"
docker compose down
echo -e "${G}deploying new docker compose version${NC}"
docker compose up -d --build
echo -e "${G}removing firebase credentials${NC}"
rm -rf credentials.json
echo -e "${G}clean env${NC}"
git checkout -- .env