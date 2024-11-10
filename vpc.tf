#terraform provider
provider "aws" {
  region = "us-east-1"
}

#create vpc using terraform resource
resource "aws_vpc" "terraform_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "terraform_vpc"
  }
}

#create internet gateway
resource "aws_internet_gateway" "terraform_igw" {
  vpc_id = aws_vpc.terraform_vpc.id

  tags = {
    Name = "terraform_igw"
  }
}

#create public subnet 1
resource "aws_subnet" "terraform_public_subnet_1" {
  vpc_id                  = aws_vpc.terraform_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "terraform_public_subnet_1"
  }
}

#create public subnet 2
resource "aws_subnet" "terraform_public_subnet_2" {
  vpc_id                  = aws_vpc.terraform_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "terraform_public_subnet_2"
  }
}

#create public subnet 3
resource "aws_subnet" "terraform_public_subnet_3" {
  vpc_id                  = aws_vpc.terraform_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "terraform_public_subnet_3"
  }
}

#create private subnet 1
resource "aws_subnet" "terraform_private_subnet_1" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = "10.0.11.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "terraform_private_subnet_1"
  }
}

#create private subnet 2
resource "aws_subnet" "terraform_private_subnet_2" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = "10.0.12.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "terraform_private_subnet_2"
  }
}

#create private subnet 3
resource "aws_subnet" "terraform_private_subnet_3" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = "10.0.13.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "terraform_private_subnet_3"
  }
}

#create public route table
resource "aws_route_table" "terraform_public_route_table" {
  vpc_id = aws_vpc.terraform_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform_igw.id
  }

  tags = {
    Name = "terraform_public_route_table"
  }
}

#create private route table
resource "aws_route_table" "terraform_private_route_table" {
  vpc_id = aws_vpc.terraform_vpc.id

  tags = {
    Name = "terraform_private_route_table"
  }
}

#create public route table associations
resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.terraform_public_subnet_1.id
  route_table_id = aws_route_table.terraform_public_route_table.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.terraform_public_subnet_2.id
  route_table_id = aws_route_table.terraform_public_route_table.id
}

resource "aws_route_table_association" "public_3" {
  subnet_id      = aws_subnet.terraform_public_subnet_3.id
  route_table_id = aws_route_table.terraform_public_route_table.id
}

#create private route table associations
resource "aws_route_table_association" "private_1" {
  subnet_id      = aws_subnet.terraform_private_subnet_1.id
  route_table_id = aws_route_table.terraform_private_route_table.id
}

resource "aws_route_table_association" "private_2" {
  subnet_id      = aws_subnet.terraform_private_subnet_2.id
  route_table_id = aws_route_table.terraform_private_route_table.id
}

resource "aws_route_table_association" "private_3" {
  subnet_id      = aws_subnet.terraform_private_subnet_3.id
  route_table_id = aws_route_table.terraform_private_route_table.id
}

#create security group
resource "aws_security_group" "terraform_security_group" {
  name        = "allow_http_ssh"
  description = "Allow HTTP and SSH traffic"
  vpc_id      = aws_vpc.terraform_vpc.id

  # Allow HTTP
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow SSH
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}