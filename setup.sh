#!/bin/bash

# Update system packages
sudo yum update -y

# Install Docker
sudo amazon-linux-extras enable docker
sudo yum install -y docker
sudo systemctl start docker
sudo systemctl enable docker

# Pull and run a Nginx container
sudo docker pull nginx
sudo docker run -d -p 80:80 nginx

# Install AWS CLI
sudo yum install -y aws-cli

# Print instance details
echo "Instance setup complete!"

