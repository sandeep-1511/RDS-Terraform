variable "aws_region" {
  description = "The AWS region to deploy the resources."
  default     = "us-east-1" // Change this as needed
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
  default     = "us-east-1a" // Change this as needed
}

variable "availability_zone2" {
  description = "The availability zone to deploy the resources."
  default     = "us-east-1c" // Change this as needed
}

variable "instance_type" {
  description = "The EC2 instance type for the auto-scaling group."
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The ID of the Amazon Machine Image (AMI) to use for the instances."
  default     = "ami-0bb84b8ffd87024d8" // Replace with your desired AMI ID
}

variable "min_size" {
  description = "The minimum number of instances in the auto-scaling group."
  default     = 1
}

variable "max_size" {
  description = "The maximum number of instances in the auto-scaling group."
  default     = 2
}


