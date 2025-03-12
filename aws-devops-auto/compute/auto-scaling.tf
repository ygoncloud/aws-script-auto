## Auto Scaling Group (compute/auto-scaling.tf)
resource "aws_launch_configuration" "web_lc" {
  name          = "web-launch-config"
  image_id      = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name      = "your-key-pair"
  security_groups = ["sg-xxxxxxx"]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "web_asg" {
  launch_configuration = aws_launch_configuration.web_lc.id
  vpc_zone_identifier  = ["subnet-xxxxxxx"]
  min_size             = 1
  max_size             = 3
  desired_capacity     = 2

  tag {
    key                 = "Name"
    value               = "EC2-ASG"
    propagate_at_launch = true
  }
}

