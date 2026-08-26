# Deployment Documentation

## 1. Objective
Deploy the provided React application in a production-ready state using Docker, Docker Compose, Bash scripting, GitHub, Docker Hub, Jenkins, AWS EC2, and open-source monitoring.

## 2. Application
Repository:

https://github.com/AnbanSiddharthan/devops-build

The application is served through Nginx on HTTP port 80.

## 3. Dockerization
A `Dockerfile` packages the React production build into an Nginx image.

The application files are copied to:

```text
/usr/share/nginx/html
```

Docker Compose configuration is provided in:

```text
docker-compose.yml
```

## 4. Bash Scripts
`build.sh` is used for building the Docker image.

`deploy.sh` is used for deploying the image to the server.

## 5. Version Control
Branches used:

```text
dev
master
```

Development changes are pushed to `dev`.

Production changes are pushed to `master`.

The repository contains `.gitignore` and `.dockerignore`.

## 6. Docker Hub

### Development
```text
anbansiddharthan/devops-build-dev
```
Visibility: Public

Tag:
```text
dev
```

### Production
```text
anbansiddharthan/devops-build-prod
```
Visibility: Private

Tag:
```text
prod
```

## 7. Jenkins

### Development Job
Job:
```text
devops-build-dev
```

Repository:
```text
https://github.com/AnbanSiddharthan/devops-build.git
```

Branch:
```text
dev
```

The job uses a GitHub webhook and performs Docker login, build, and push.

### Production Job
Job:
```text
devops-build-prod
```

Repository:
```text
https://github.com/AnbanSiddharthan/devops-build.git
```

Branch:
```text
master
```

The job uses a GitHub webhook and performs Docker login, build, and push.

## 8. CI/CD Flow

Development:
```text
Push to dev
   ↓
GitHub webhook
   ↓
Jenkins dev job
   ↓
Docker build
   ↓
Docker Hub dev image
```

Production:
```text
Push to master
   ↓
GitHub webhook
   ↓
Jenkins prod job
   ↓
Docker build
   ↓
Docker Hub prod image
```

## 9. AWS EC2 Deployment

EC2 public IP:

```text
51.20.68.224
```

Production image:

```text
anbansiddharthan/devops-build-prod:prod
```

The image was pulled with:

```bash
docker pull anbansiddharthan/devops-build-prod:prod
```

The application was started with:

```bash
docker run -d --name devops-app -p 80:80 anbansiddharthan/devops-build-prod:prod
```

The container was verified using:

```bash
docker ps
```

The application was verified locally using:

```bash
curl http://localhost
```

## 10. Application Verification

Application URL:

http://51.20.68.224

The React application was successfully served from the production Docker container.

## 11. AWS Security Group

The configured rules include:

```text
HTTP 80
SSH 22
Prometheus 9090
```

HTTP is available for application access.

SSH is restricted according to the configured source IP.

Prometheus port 9090 is allowed for monitoring access.

## 12. Monitoring

Prometheus was deployed using Docker Compose.

Prometheus URL:

```text
http://51.20.68.224:9090
```

The Target Health page was checked and showed:

```text
1 / 1 up
State: UP
```

This confirms the configured Prometheus target is healthy.

## 13. Screenshots

All required screenshots are stored in:

```text
screenshots/
```

They document Jenkins, AWS, Docker Hub, the deployed application, and Prometheus monitoring.

## 14. Submission

GitHub:
https://github.com/AnbanSiddharthan/devops-build

Deployed Site:
http://51.20.68.224

Docker Dev:
```text
anbansiddharthan/devops-build-dev:dev
```

Docker Prod:
```text
anbansiddharthan/devops-build-prod:prod
```

## 15. Final Status

Dockerization, Docker Hub repositories, Jenkins CI/CD, GitHub webhook triggering, AWS EC2 deployment, monitoring, and required screenshot documentation have been completed.
