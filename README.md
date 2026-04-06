# CloudDock Deploy — Containerized Web App Deployment on AWS Infrastructure

CloudDock Deploy is a hands-on project that shows how to build and deploy a web application. It uses Docker, Terraform, GitHub Actions, and AWS.

This project follows a real DevOps workflow. It covers application packaging, infrastructure provisioning, CI validation, and cloud-based hosting.

---
## Project Objectives

- Build a lightweight static web application
- Containerize the application using Docker
- Manage source code with Git and GitHub
- Automate validation with GitHub Actions CI
- Provision custom AWS infrastructure using Terraform
- Deploy the application to an EC2 instance
- Expose the application publicly over HTTP

---
## Tech Stack

- **Cloud & Infrastructure:** AWS (VPC, Subnet, Route table, IGW, Route_table_association, Security Groups, EC2)
- **Infrastructure as Code:** Terraform
- **Containerization:** Docker
- **CI/CD:** GitHub Actions (CI)
- **OS:** Linux (Ubuntu)

---
## Project Architecture

This project provisions a custom AWS network and deploys a Dockerized web application inside it.

### Application components
- Static HTML page
- Docker image
- Docker container running on EC2

### CI components
- GitHub Actions workflow
- Automated Docker build validation on push and pull request

---
## Project Structure

```bash
clouddock-deploy-aws/
├── app/
│   ├── Dockerfile
│   └── index.html
├── terraform/
│   ├── compute.tf
│   ├── network.tf
│   ├── outputs.tf
│   ├── provider.tf
│   ├── security.tf
│   ├── terraform.tfvars.example
│   └── variables.tf
├── .github/
│   └── workflows/
│       └── ci.yml
├── .gitignore
└── README.md
```

---
## Local Application Build

Build the Docker image locally to verify the application :
```bash
docker build -t clouddock-deploy ./app
```
Run the container locally to test it:
```bash
docker run -d -p 8080:80 --name clouddock-container clouddock-deploy
```
Open in browser and access the app at: http://localhost:8080

---
## CI Workflow
This project includes a GitHub Actions CI pipeline that automatically validates the Docker image build on:
- push to `main`
- pull requests to `main`

Workflow file: `.github/workflows/ci.yml`

---
## Terraform Infrastructure Deployment

1. Navigate to the Terraform directory
```bash
cd terraform
```
2. Initialize Terraform
```bash
terraform init
```
3. Format configuration files
```bash
terraform fmt
```
4. Validate Configuration
```bash
terraform validate
```
5. Review execution plan
```bash
terraform plan
```
6. Apply Infrastructure
```bash
terraform apply
```
---
## Terraform Variables
This project does not include real secret values. Instead, it provides a template:
```bash
terraform/terraform.tfvars.example
```
To use it:
1. Copy the example file
2. Rename it to:
```bash
terraform.tfvars
```
3. Replace the placeholder values with your own AWS configuration
Example:
```bash
cp terraform.tfvars.example terraform.tfvars
```
terraform.tfvars is intentionally hidden by .gitignore so it stays off Github.

---
## EC2 Deployment Steps
After Terraform creates the infrastructure:

### Connect to the EC2 instance
```bash
ssh your-key.pem ubuntu@YOUR_PUBLIC_IP
```
### Install Docker on the server
```bash
sudo apt update && sudo apt upgrade -y
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ubuntu
```
Reconnect to the server after adding the Docker group.

### Clone the project
```bash
git clone YOUR_GITHUB_REPOSITORY_URL
cd clouddock-deploy-aws
```
### Build the image on EC2
```bash
docker build -t clouddock-deploy ./app
```
### Run the container
```bash
docker run -d -p 80:80 --name clouddock-container clouddock-deploy
```
### Access the application
http://YOUR_PUBLIC_IP

---
## Deployment Flow
```bash
Local Machine
   ↓
GitHub
   ↓
GitHub Actions CI
   ↓
Terraform Provisioning
   ↓
AWS EC2 Instance
   ↓
Docker Container
   ↓
Public Web (http) Access
```

---
## Security Notes
- Real Terraform values are never saved on Github
- Sensitive files are hidden with `.gitignore`
- SSH access is limited to trusted IPs for better security in production
  
---
## Current Status
Completed:
  - Application containerization
  - Github repository structure
  - Github Actions CI workflow
  - Terraform-based AWS infrastructure provisioning
  - Manual deployment to EC2
  - Public HTTP access

---
## Future Improvements
- Automated deployment with Github Actions CD 
- Docker image registry integration
- Nginx reverse proxy
- Domain name and HTTPS support
- Infrastructure modularization
- User Data or cloud-init bootstrapping