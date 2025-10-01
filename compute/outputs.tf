output "autoscaling_group_name" {
  description = "The name of the autoscaling group"
  value       = aws_autoscaling_group.web_asg.name
}
