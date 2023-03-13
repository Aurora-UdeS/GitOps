[![Dockerized-db pipeline](https://github.com/Aurora-UdeS/dockerized-db/actions/workflows/pipeline.yml/badge.svg)](https://github.com/Aurora-UdeS/dockerized-db/actions/workflows/pipeline.yml)
[![organization pipeline](https://github.com/Aurora-UdeS/organization/actions/workflows/pipeline.yaml/badge.svg)](https://github.com/Aurora-UdeS/organization/actions/workflows/pipeline.yaml)
[![expenses pipeline](https://github.com/Aurora-UdeS/expenses/actions/workflows/pipeline.yaml/badge.svg)](https://github.com/Aurora-UdeS/expenses/actions/workflows/pipeline.yaml)
[![timesheet pipeline](https://github.com/Aurora-UdeS/timesheet/actions/workflows/pipeline.yaml/badge.svg)](https://github.com/Aurora-UdeS/timesheet/actions/workflows/pipeline.yaml)
[![adminSDK pipeline](https://github.com/Aurora-UdeS/adminsdk/actions/workflows/pipeline.yml/badge.svg)](https://github.com/Aurora-UdeS/adminsdk/actions/workflows/pipeline.yml)
[![git activity fetcher pipeline](https://github.com/Aurora-UdeS/git-activity-fetcher/actions/workflows/pipeline.yml/badge.svg)](https://github.com/Aurora-UdeS/git-activity-fetcher/actions/workflows/pipeline.yml)
# GitOps
This repo contains workflow and deployment related files.

## How to use workflow
The repo [git activity fetcher](https://github.com/Aurora-UdeS/git-activity-fetcher) should be used as an implementation reference.

### Add secrets to your repo
secrets to add:
* GITOPS_SSH_PRIVATE_KEY -> email bela1003@usherbrooke.ca

### Add workflow yml to your repo
```yml
name: '<< repo name >> pipeline'

on:
  # execute pipeline at every push
  push:

jobs:
  # build docker image and push it on the registry
  build-push-docker:
    uses: Aurora-UdeS/GitOps/.github/workflows/buildPushDocker.yml@main
  # spins up the docker compose in the cloud VM
  deploy:
    if: github.ref_name == 'main'
    needs: build-push-docker
    uses: Aurora-UdeS/GitOps/.github/workflows/deploy.yml@main
    secrets:
      GITOPS_PRIVATE_SSH_KEY: ${{ secrets.GITOPS_PRIVATE_SSH_KEY }}
    with:
      # used to update the docker compose yml with the latest docker image tag
      SERVICE_NAME: << NAME OF THE REPO IN CAPS WITH UNDERSCORES >>
```

## How to use docker compose
### NGINX
This is the gateway. It is setup to redirect based on URI rules and validate an apikey. To add an apikey, you need to create a map.conf file under nginx directory
```bash
cat <<EOF > nginx/map.conf
map $http_apikey $api_client_name {
    default       "";
    "b28d443c-12a8-49b7-ab51-94fft027564d"  "frontend";
}
EOF
```
### .env
The docker compose yml needs a .env to build. The one already used is missing a GITHUB_ACCESS_TOKEN. It needs to be added.
```bash
echo -e "\nGITHUB_ACCESS_TOKEN=<< YOUR GITHUB ACCESS TOKEN >>" >> .env
```

### docker compose
Last step is to spin up the docker compose
```bash
sudo docker compose up --build
```
