# 🚀 AWS DevOps Automation Scripts

## 📌 Overview
This repository contains **daily-use DevOps automation scripts** designed to simplify infrastructure provisioning, server setup, and cloud management tasks. The main automation script **provisions an AWS EC2 instance using Terraform** and **configures it automatically using a Bash script**.

## 🔧 Features
✔ **Infrastructure as Code (IaC)** with Terraform  
✔ **Automated server provisioning** on AWS  
✔ **Docker & Nginx auto-installation**  
✔ **AWS CLI setup for cloud resource management**  
✔ **Scalable – Modify Terraform variables to deploy multiple instances**  

---

## 🛠 Setup & Installation

### **1️⃣ Prerequisites**
Ensure you have the following installed:
- **Terraform** (>=1.0) → [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- **AWS CLI** (>=2.0) → [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- **AWS IAM Access** → Create an IAM user with EC2 permissions

---

### **2️⃣ Configure AWS Credentials**
Run the following command to authenticate Terraform with AWS:

```bash
aws configure

