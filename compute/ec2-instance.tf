## EC2 Instance (compute/ec2-instance.tf)
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id     = "subnet-xxxxxxx"
  vpc_security_group_ids = ["sg-xxxxxxx"]
  key_name      = "your-key-pair"

  tags = {
    Name = "EC2-WebServer"
  }
}

output "ec2_instance_ip" {
  value = aws_instance.web_server.public_ip
}

