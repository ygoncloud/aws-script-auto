provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = "your-key"   # Replace with your key pair
  user_data     = file("setup.sh")  # Run Bash script on instance launch

  tags = {
    Name = "Terraform-Automation"
  }
}

output "public_ip" {
  value = aws_instance.web.public_ip
}

