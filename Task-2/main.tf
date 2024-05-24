resource "aws_db_instance" "rds_instance" {
  identifier           = "mydb"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0.35"
  instance_class       = var.db_instance_class
  username             = var.db_username
  password             = var.db_password
  skip_final_snapshot    = true
  parameter_group_name   = "default.mysql8.0"
  publicly_accessible  = false
  vpc_security_group_ids = [var.security_group]
  db_subnet_group_name   = aws_db_subnet_group.default.name
}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = var.subnet_id

  tags = {
    Name = "My DB subnet group"
  }
}
