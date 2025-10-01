# AWS DevOps Automation

This repository provides automation scripts for common AWS DevOps tasks. It uses Terraform to provision a scalable AWS EC2 environment with Docker and Nginx, and includes configurations for essential DevOps practices.

## Features

*   **Infrastructure as Code (IaC)**: Leverages Terraform for defining and managing infrastructure.
*   **Automated AWS Server Provisioning**: Quickly sets up EC2 instances within an Auto Scaling Group.
*   **Load Balancing**: Integrates an Application Load Balancer (ALB) for efficient traffic distribution and high availability.
*   **Secrets Management**: Utilizes AWS Secrets Manager for secure handling of sensitive data like database credentials.
*   **Centralized Logging & Monitoring**: Configures CloudWatch Logs for log collection and CloudWatch Dashboards/Alarms for observability.
*   **Docker & Nginx Installation**: Automatically installs Docker and Nginx on provisioned servers.
*   **AWS CLI Setup**: Configures AWS CLI for cloud resource management.
*   **Scalable Deployments**: Easily deploy multiple instances by adjusting Terraform variables.
*   **Basic CI/CD Pipeline Setup**: Lays the groundwork for automated application deployments using AWS CodePipeline, CodeBuild, and CodeDeploy.

## Setup & Installation

### 1. Prerequisites

Ensure you have the following installed:

*   **Terraform** (>=1.0): [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
*   **AWS CLI** (>=2.0): [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
*   **AWS IAM Access**: Create an IAM user with appropriate permissions.

### 2. Configure AWS Credentials

Authenticate Terraform with AWS by running:

```bash
aws configure
```

## Next Steps / Future Enhancements

*   **Complete CI/CD Pipeline**: Further configure the CodePipeline, CodeBuild, and CodeDeploy resources within the `cicd` module to fully automate your application's build and deployment process. This will require defining your source code repository, build specifications, and deployment strategy.
*   **Application Deployment**: Integrate your application's deployment artifacts and scripts into the CI/CD pipeline.
*   **Advanced Monitoring**: Implement more detailed application-level monitoring and custom metrics.
*   **Cost Optimization**: Explore options like EC2 Spot Instances for non-critical workloads.
