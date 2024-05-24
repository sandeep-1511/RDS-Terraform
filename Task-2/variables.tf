variable "aws_region" {
  description = "The AWS region to deploy the resources."
  default     = "us-east-1" 
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  description = "The CIDR block for the public subnet."
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr_block" {
  description = "The CIDR block for the private subnet."
  default     = "10.0.2.0/24"
}

variable "availability_zone" {
  description = "The availability zone to deploy the resources."
  default     = "us-east-1a" 
}

variable "availability_zone2" {
  description = "The availability zone to deploy the resources."
  default     = "us-east-1c" 
}

variable "instance_type" {
  description = "The EC2 instance type for the auto-scaling group."
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The ID of the Amazon Machine Image (AMI) to use for the instances."
  default     = "ami-0bb84b8ffd87024d8" 

variable "min_size" {
  description = "The minimum number of instances in the auto-scaling group."
  default     = 1
}

variable "max_size" {
  description = "The maximum number of instances in the auto-scaling group."
  default     = 2
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

variable "security_group_name" {
  type    = string
  default = "default_sg"
}

