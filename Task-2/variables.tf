variable "aws_region" {
  description = "The AWS region to deploy the resources."
}

variable "db_name" {
  description = "The name of the MySQL database."
  default     = "mydb"
}

variable "db_username" {
  description = "The username for the MySQL database."
  default     = "admin"
}

variable "db_password" {
  description = "The password for the MySQL database."
  default     = "password123"
}

variable "db_instance_class" {
  description = "The DB instance class for the RDS MySQL DB."
  default     = "db.t3.micro"
}

variable "security_group" {
  description = "The security group ID for the RDS instance."
}

variable "subnet_id" {
  description = "The subnet ID for the RDS instance."
}
