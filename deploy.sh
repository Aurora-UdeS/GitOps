#!/bin/bash -p

G='\033[0;32m'
NC='\033[0m'

function cleanup() {
    echo -e "${G}removing firebase credentials${NC}"
    rm -rf credentials.json
    echo -e "${G}clean env${NC}"
    git checkout -- .env
    exit $1
}

echo -e "${G}pulling latest changes${NC}"
git pull
echo -e "${G}fetching adminsdk credentials${NC}"
sudo gcloud secrets versions access 3 --secret=adminsdk_secret_key --out-file=credentials.json

trap "cleanup 1" SIGINT SIGTERM

echo -e "${G}fetch and insert github client id/secret in env${NC}"
sed -i "s/GITHUB_CLIENT_ID=.*/GITHUB_CLIENT_ID=$(gcloud secrets versions access 1 --secret=github_client_id)/" .env
sed -i "s/GITHUB_CLIENT_SECRET=.*/GITHUB_CLIENT_SECRET=$(gcloud secrets versions access 1 --secret=github_client_secret)/" .env
echo -e "${G}fetch and insert postgres secret in env${NC}"
sed -i "s/DB_USER=.*/DB_USER=$(gcloud secrets versions access 2 --secret=postgres_user)/" .env
sed -i "s/DB_SUPERUSER_PASSWORD=.*/DB_SUPERUSER_PASSWORD=$(gcloud secrets versions access 1 --secret=postgres_password)/" .env
sed -i "s/DB_PASSWORD=.*/DB_PASSWORD=$(gcloud secrets versions access 2 --secret=postgres_password)/" .env
sed -i "s/EMAIL_USERNAME=.*/EMAIL_USERNAME=$(gcloud secrets versions access 1 --secret=email_username)/" .env
sed -i "s/EMAIL_PASSWORD=.*/EMAIL_PASSWORD=$(gcloud secrets versions access 1 --secret=email_password)/" .env
echo -e "${G}fetch and insert coinmarketcap secret in env${NC}"
sed -i "s/COINMARKETCAP_API_KEY=.*/COINMARKETCAP_API_KEY=$(gcloud secrets versions access 1 --secret=coinmarketcap_api_key)/" .env
echo -e "${G}setup NGINX port${NC}"
if [ "$1" = "local" ]; then
    sed -i "s/NGINX_PORT=.*/NGINX_PORT=5174/" .env
else
    sed -i "s/NGINX_PORT=.*/NGINX_PORT=80/" .env
fi
echo -e "${G}stopping docker compose${NC}"
docker compose down
echo -e "${G}deploying new docker compose version${NC}"
docker compose up -d --build
cleanup 0
