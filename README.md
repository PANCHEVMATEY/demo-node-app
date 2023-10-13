# Node.js Docker Container to AWS ECS

This repository provides a guide and sample configuration for deploying a Node.js Docker container to AWS ECS, creating a task definition, and setting up an ECS cluster.

## Prerequisites

Before you begin, ensure you have the following prerequisites:

- An AWS account with appropriate IAM permissions.
- Docker installed locally.
- AWS CLI and AWS CLI configured with the necessary credentials.
- Node.js and npm installed locally.

## Getting Started

Follow these steps to deploy your Node.js Docker container to AWS ECS:

### 1. Clone the Repository

```bash
git clone https://github.com/PANCHEVMATEY/demo-node-app.git
cd your-repo
```

### 2. Build Your Docker Image

```bash
docker build -t your-image-name:your-image-tag .
```

### 3. Push the Docker Image to Amazon ECR

```bash
# Create an ECR repository (if not already created) and authenticate Docker to your AWS account.
# Replace "your-repo-name" with your desired ECR repository name.
aws ecr create-repository --repository-name your-repo-name
$(aws ecr get-login --no-include-email --region your-region)

# Tag your Docker image.
docker tag your-image-name:your-image-tag your-account-id.dkr.ecr.your-region.amazonaws.com/your-repo-name:your-image-tag

# Push the image to Amazon ECR.
docker push your-account-id.dkr.ecr.your-region.amazonaws.com/your-repo-name:your-image-tag
```

### 4. Create an ECS Task Definition

```bash
# Use the provided "ecs-task-definition.json" as a template for your task definition.
# Customize it according to your requirements.

aws ecs register-task-definition --cli-input-json file://ecs-task-definition.json
```

### 5. Create an ECS Cluster

```bash
# Create an ECS cluster (if not already created).
# Replace "your-cluster-name" with your desired cluster name.
aws ecs create-cluster --cluster-name your-cluster-name
```

### 6. Create an ECS Service

```bash
# Create an ECS service using your task definition and cluster.
# Replace "your-service-name" with your desired service name.
aws ecs create-service --cluster your-cluster-name --service-name your-service-name --task-definition your-task-definition-name --desired-count 1
```

## Usage

Once your ECS service is up and running, you can access your Node.js application through the Load Balancer or the public IP, depending on your network configuration.

