## IAM Role (iam/iam-role.tf)
resource "aws_iam_role" "ec2_role" {
  name = "EC2InstanceRole"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "s3_read_access" {
  name       = "s3-read-access"
  roles      = [aws_iam_role.ec2_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

resource "aws_iam_policy" "secrets_manager_read_policy" {
  name        = "SecretsManagerReadPolicy"
  description = "Allows EC2 instances to read secrets from Secrets Manager"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret",
        ]
        Effect   = "Allow"
        Resource = "*" # Restrict this to specific secret ARNs in a production environment
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "secrets_manager_read_attachment" {
  name       = "secrets-manager-read-attachment"
  roles      = [aws_iam_role.ec2_role.name]
  policy_arn = aws_iam_policy.secrets_manager_read_policy.arn
}

resource "aws_iam_policy_attachment" "cloudwatch_agent_policy_attachment" {
  name       = "cloudwatch-agent-policy-attachment"
  roles      = [aws_iam_role.ec2_role.name]
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "EC2InstanceProfile"
  role = aws_iam_role.ec2_role.name
}

output "iam_role_name" {
  value = aws_iam_role.ec2_role.name
}
