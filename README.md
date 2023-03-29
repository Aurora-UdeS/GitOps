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
- `GITOPS_PRIVATE_SSH_KEY` : private ssh key used to clone the repo
This can be done by accessing the secret stored in google cloud secret manager.
#### How to access google cloud secret manager using the gcloud sdk
```bash
gcloud secrets versions access 2 --secret=gitops-ssh-secret-key
```
#### How to access google cloud secret manager using the web console
- Go to [google cloud secret manager](https://console.cloud.google.com/security/secret-manager)

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
These script are meant to be used where they are. Meaning you will need to open a terminal here to run them.
### pre-req
#### gcloud sdk
download the sdk from [here](https://cloud.google.com/sdk/docs/install)
If you're on Windows, make sure to restart your computer after installing the sdk.
### setup environment
This script will setup your environment to be able to use the docker compose.  
If you are using a Windows machine, you will need to run the script in a WSL terminal or a GitBash terminal.
It will ask you to connect to your google account. You will need to select to one used on google cloud platform.
```bash
./setup.sh
```

### lauch docker compose locally
Last step is to spin up the docker compose.  
```bash
./deploy.sh local
```
