provider "aws" {
  region = var.aws_region
}

// Define VPC, subnets, internet gateway, NAT gateway, route tables, and security groups

resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "my-vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_subnet_cidr_block
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true  

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.private_subnet_cidr_block
  availability_zone = var.availability_zone2

  tags = {
    Name = "private-subnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "internet-gateway"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "nat-gateway"
  }
}

resource "aws_eip" "nat" {
  vpc = true

  tags = {
    Name = "nat-eip"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "private-route-table"
  }
}

resource "aws_route_table_association" "private_subnet" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private.id
}

resource "aws_security_group" "ssh_only" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssh-only-sg"
  }
}

resource "aws_security_group" "rds_sg" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr_block]  
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-sg"
  }
}

module "autoscaling" {
  source         = "./autoscaling"
  aws_region     = var.aws_region
  instance_type  = var.instance_type
  ami_id         = var.ami_id
  min_size       = var.min_size
  max_size       = var.max_size
  public_subnet = aws_subnet.public_subnet.id
  security_group = aws_security_group.ssh_only.id
  key_name       = "kumar"
}

module "rds" {
  source            = "./rds"
  aws_region        = var.aws_region
  db_name           = var.db_name
  db_username       = var.db_username
  db_password       = var.db_password
  db_instance_class = var.db_instance_class
  security_group    = aws_security_group.rds_sg.id
  subnet_id         = [aws_subnet.public_subnet.id,aws_subnet.private_subnet.id]
}
