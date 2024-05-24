variable "aws_region" {
  description = "The AWS region to deploy the resources."
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

variable "public_subnet" {
  description = "The private subnet ID for the auto-scaling group."
}

variable "security_group" {
  description = "The security group ID for the auto-scaling group."
}
