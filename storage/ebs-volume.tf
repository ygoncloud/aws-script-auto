## EBS Volume (storage/ebs-volume.tf)
resource "aws_ebs_volume" "my_volume" {
  availability_zone = "us-east-1a"
  size             = 20
  type             = "gp2"

  tags = {
    Name = "MyEBSVolume"
  }
}

resource "aws_volume_attachment" "ebs_attach" {
  device_name = "/dev/xvdf"
  volume_id   = aws_ebs_volume.my_volume.id
  instance_id = aws_instance.web_server.id
}
