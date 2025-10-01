## Auto Scaling Group (compute/auto-scaling.tf)
resource "aws_launch_configuration" "web_lc" {
  name          = "web-launch-config"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  security_groups = [var.security_group_id]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "web_asg" {
  launch_configuration = aws_launch_configuration.web_lc.id
  vpc_zone_identifier  = [var.subnet_id]
  min_size             = 1
  max_size             = 3
  desired_capacity     = 2

  tag {
    key                 = "Name"
    value               = "EC2-ASG"
    propagate_at_launch = true
  }
}

