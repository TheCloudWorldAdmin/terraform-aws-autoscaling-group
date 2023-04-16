resource "aws_launch_template" "lt" {
  name_prefix   = "launch"
  image_id      = "ami-069aabeee6f53e7bf"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "asg" {
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1
  health_check_type = "EC2"
  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }
}
