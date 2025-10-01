## Auto Scaling Group (compute/auto-scaling.tf)
resource "aws_launch_configuration" "web_lc" {
  name          = "web-launch-config"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  security_groups = [var.security_group_id, var.alb_security_group_id]
  iam_instance_profile = "EC2InstanceProfile"
  user_data = <<EOF
#!/bin/bash
yum update -y
yum install -y amazon-cloudwatch-agent

cat <<'EOT' > /opt/aws/amazon-cloudwatch-agent/bin/config.json
{
  "agent": {
    "metrics_collection_interval": 60,
    "run_as_user": "root"
  },
  "logs": {
    "logs_collected": {
      "files": {
        "collect_list": [
          {
            "file_path": "/var/log/syslog",
            "log_group_name": "/aws/ec2/web-server",
            "log_stream_name": "{instance_id}",
            "timezone": "UTC"
          }
        ]
      }
    }
  }
}
EOT

/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/opt/aws/amazon-cloudwatch-agent/bin/config.json -s
EOF

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "web_asg" {
  launch_configuration = aws_launch_configuration.web_lc.id
  vpc_zone_identifier  = var.subnet_ids
  min_size             = 1
  max_size             = 3
  desired_capacity     = 2

  target_group_arns = [aws_lb_target_group.main_tg.arn]

  tag {
    key                 = "Name"
    value               = "EC2-ASG"
    propagate_at_launch = true
  }
}

