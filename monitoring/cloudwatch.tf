## CloudWatch Monitoring (monitoring/cloudwatch.tf)
resource "aws_cloudwatch_log_group" "web_log_group" {
  name = "/aws/ec2/web-server"
  retention_in_days = 7
}

resource "aws_cloudwatch_log_stream" "web_log_stream" {
  name           = "web-server-stream"
  log_group_name = aws_cloudwatch_log_group.web_log_group.name
}

resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "HighCPUUtilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace          = "AWS/EC2"
  period             = 60
  statistic          = "Average"
  threshold          = 80
  alarm_description  = "This metric monitors EC2 instance CPU utilization"
  alarm_actions      = []
  dimensions = {
    InstanceId = aws_instance.web_server.id
  }
}

