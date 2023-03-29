[![Dockerized-db pipeline](https://github.com/Aurora-UdeS/dockerized-db/actions/workflows/pipeline.yml/badge.svg)](https://github.com/Aurora-UdeS/dockerized-db/actions/workflows/pipeline.yml)
[![organization pipeline](https://github.com/Aurora-UdeS/organization/actions/workflows/pipeline.yaml/badge.svg)](https://github.com/Aurora-UdeS/organization/actions/workflows/pipeline.yaml)
[![expenses pipeline](https://github.com/Aurora-UdeS/expenses/actions/workflows/pipeline.yaml/badge.svg)](https://github.com/Aurora-UdeS/expenses/actions/workflows/pipeline.yaml)
[![timesheet pipeline](https://github.com/Aurora-UdeS/timesheet/actions/workflows/pipeline.yml/badge.svg)](https://github.com/Aurora-UdeS/timesheet/actions/workflows/pipeline.yml)
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
name: '<<repo name>> pipeline'

on:
  push:

jobs:
  build-docker:
    uses: Aurora-UdeS/GitOps/.github/workflows/buildDocker.yml@main

  push-docker:
    needs: build-docker
    uses: Aurora-UdeS/GitOps/.github/workflows/pushDocker.yml@main
    
  deploy:
    if: github.ref_name == 'main'
    needs: push-docker
    uses: Aurora-UdeS/GitOps/.github/workflows/deploy.yml@main
    secrets:
      GITOPS_PRIVATE_SSH_KEY: ${{ secrets.GITOPS_PRIVATE_SSH_KEY }}
    with:
      SERVICE_NAME: <<REPO_NAME_WITH_UNDERSCORE>>
```

## How to use docker compose
### setup environment
```bash
./setup.sh
```

### lauch docker compose locally
Last step is to spin up the docker compose
```bash
./deploy.sh local
```
