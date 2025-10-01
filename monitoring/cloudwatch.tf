## CloudWatch Monitoring (monitoring/cloudwatch.tf)
resource "aws_cloudwatch_log_group" "web_log_group" {
  name = "/aws/ec2/web-server"
  retention_in_days = 7
}

resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "HighCPUUtilization-ASG"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace          = "AWS/EC2"
  period             = 60
  statistic          = "Average"
  threshold          = 80
  alarm_description  = "This metric monitors EC2 Auto Scaling Group CPU utilization"
  alarm_actions      = []
  dimensions = {
    AutoScalingGroupName = module.compute.autoscaling_group_name
  }
}

resource "aws_cloudwatch_dashboard" "web_dashboard" {
  dashboard_name = "Web-Server-Dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6
        properties = {
          metrics = [
            [ "AWS/EC2", "CPUUtilization", "AutoScalingGroupName", module.compute.autoscaling_group_name ]
          ]
          stat     = "Average"
          period   = 300
          region   = var.aws_region
          title    = "ASG CPU Utilization"
        }
      },
      {
        type   = "log"
        x      = 0
        y      = 7
        width  = 12
        height = 6
        properties = {
          query   = "SOURCE '/aws/ec2/web-server' | fields @timestamp, @message | sort @timestamp desc | limit 20"
          region  = var.aws_region
          title   = "Web Server Logs"
        }
      }
    ]
  })
}

