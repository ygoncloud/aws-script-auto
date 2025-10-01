# AWS DevOps Automation

This repository provides automation scripts for common AWS DevOps tasks. The primary script uses Terraform to provision an AWS EC2 instance and a Bash script for automatic configuration.

## Features

*   **Infrastructure as Code (IaC)**: Leverages Terraform for defining and managing infrastructure.
*   **Automated AWS Server Provisioning**: Quickly sets up EC2 instances.
*   **Docker & Nginx Installation**: Automatically installs Docker and Nginx on provisioned servers.
*   **AWS CLI Setup**: Configures AWS CLI for cloud resource management.
*   **Scalable Deployments**: Easily deploy multiple instances by adjusting Terraform variables.

## Setup & Installation

### 1. Prerequisites

Ensure you have the following installed:

*   **Terraform** (>=1.0): [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
*   **AWS CLI** (>=2.0): [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
*   **AWS IAM Access**: Create an IAM user with appropriate EC2 permissions.

### 2. Configure AWS Credentials

Authenticate Terraform with AWS by running:

```bash
aws configure
```