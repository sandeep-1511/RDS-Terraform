resource "aws_launch_configuration" "autoscaling_lc" {
  name          = "autoscaling_lc"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name       = var.key_name
  security_groups = [var.security_group]
}

resource "aws_autoscaling_group" "autoscaling_asg" {
  name                 = "autoscaling_asg"
  launch_configuration = aws_launch_configuration.autoscaling_lc.id
  min_size             = var.min_size
  max_size             = var.max_size
  vpc_zone_identifier  = [var.public_subnet]
}

