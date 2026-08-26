# DevOps Build – React Application Deployment

## Project Overview
This project demonstrates deployment of a React application using Docker, Docker Compose, Bash scripting, GitHub, Docker Hub, Jenkins, AWS EC2, and Prometheus monitoring.

The application is served over HTTP on port 80.

## Repository
https://github.com/AnbanSiddharthan/devops-build

## Technology Stack
- React
- Docker
- Docker Compose
- Bash
- Git / GitHub
- Docker Hub
- Jenkins
- AWS EC2
- Prometheus

## Project Structure
```text
devops-build/
├── build/
├── Dockerfile
├── docker-compose.yml
├── build.sh
├── deploy.sh
├── .dockerignore
├── .gitignore
└── screenshots/
```

## Docker Images

Development:
```text
anbansiddharthan/devops-build-dev:dev
```

Production:
```text
anbansiddharthan/devops-build-prod:prod
```

The production Docker Hub repository is private.

## Git Branches
- `dev` – development branch
- `master` – production branch

## Jenkins CI/CD

### Development
Jenkins job: `devops-build-dev`

```text
GitHub dev push
      ↓
GitHub webhook
      ↓
Jenkins
      ↓
Docker build
      ↓
Docker Hub dev image
```

Image:
```text
anbansiddharthan/devops-build-dev:dev
```

### Production
Jenkins job: `devops-build-prod`

```text
GitHub master push
      ↓
GitHub webhook
      ↓
Jenkins
      ↓
Docker build
      ↓
Docker Hub prod image
```

Image:
```text
anbansiddharthan/devops-build-prod:prod
```

## AWS Deployment

Production application:

http://51.20.68.224

The application runs in Docker with:

```text
EC2 port 80 → Docker port 80
```

## Monitoring

Prometheus:

http://51.20.68.224:9090

The Prometheus Target Health page was verified with:

```text
1 / 1 up
State: UP
```

## Security Group

| Purpose | Port | Source |
|---|---:|---|
| HTTP | 80 | 0.0.0.0/0 |
| SSH | 22 | Allowed source IP |
| Prometheus | 9090 | My IP |

## Bash Scripts

- `build.sh` – builds the Docker image
- `deploy.sh` – deploys the image to the server

## Screenshots

The required screenshots are stored in the `screenshots/` directory.

They cover:
- Jenkins login and configuration
- Jenkins successful development and production builds
- AWS EC2
- AWS Security Group
- Docker Hub development and production repositories
- Deployed application
- Prometheus monitoring

## Assignment Checklist

| Requirement | Status |
|---|---|
| Dockerfile | Completed |
| Docker Compose | Completed |
| build.sh | Completed |
| deploy.sh | Completed |
| GitHub dev branch | Completed |
| Docker Hub dev repository | Completed |
| Docker Hub prod repository | Completed |
| Jenkins build and push | Completed |
| GitHub webhook trigger | Completed |
| AWS EC2 deployment | Completed |
| Security Group | Completed |
| Open-source monitoring | Completed |
| Required screenshots | Completed |

## Submission Details

**GitHub:** https://github.com/AnbanSiddharthan/devops-build

**Deployed Site:** http://51.20.68.224

**Docker Dev:** `anbansiddharthan/devops-build-dev:dev`

**Docker Prod:** `anbansiddharthan/devops-build-prod:prod`
