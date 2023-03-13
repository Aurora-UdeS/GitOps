#!/bin/bash

G='\033[0;32m'
NC='\033[0m'

cd ~/GitOps
echo -e "${G}pulling latest changes${NC}"
git pull
echo -e "${G}dumping database to temp file${NC}"
docker compose exec -i dockerized-db /bin/bash -c "PGPASSWORD=$DB_PASSWORD pg_dump -U $DB_USER postgres" > db_dump.sql
echo -e "${G}stopping docker compose${NC}"
docker compose down
echo -e "${G}deploying new docker compose version${NC}"
docker compose up -d --build
echo -e "${G}restoring database${NC}"
docker compose exec -i dockerized-db /bin/bash -c "PGPASSWORD=$DB_PASSWORD psql -U $DB_USER postgres" < db_dump.sql
echo -e "${G}removing temp file${NC}"
# rm -rf db_dump.sql