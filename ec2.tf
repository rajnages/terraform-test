# Create EC2 instances in public subnets
resource "aws_instance" "public_ec2_1" {
  ami           = "ami-0c7217cdde317cfec"  # Amazon Linux 2023 AMI for us-east-1
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.terraform_public_subnet_1.id
  
  vpc_security_group_ids = [aws_security_group.terraform_security_group.id]
  key_name = "terraform-key"

  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install nginx -y
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = {
    Name = "public_ec2_1"
  }
}

resource "aws_instance" "public_ec2_2" {
  ami           = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.terraform_public_subnet_2.id
  
  vpc_security_group_ids = [aws_security_group.terraform_security_group.id]
  key_name = "terraform-key"

  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install nginx -y
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = {
    Name = "public_ec2_2"
  }
}

resource "aws_instance" "public_ec2_3" {
  ami           = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.terraform_public_subnet_3.id
  
  vpc_security_group_ids = [aws_security_group.terraform_security_group.id]
  key_name = "terraform-key"
  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install nginx -y
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = {
    Name = "public_ec2_3"
  }
}

# Create EC2 instances in private subnets
resource "aws_instance" "private_ec2_1" {
  ami           = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.terraform_private_subnet_1.id
  
  vpc_security_group_ids = [aws_security_group.terraform_security_group.id]
  key_name = "terraform-key"

  tags = {
    Name = "private_ec2_1"
  }
}

resource "aws_instance" "private_ec2_2" {
  ami           = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.terraform_private_subnet_2.id
  
  vpc_security_group_ids = [aws_security_group.terraform_security_group.id]
  key_name = "terraform-key"

  tags = {
    Name = "private_ec2_2"
  }
}

resource "aws_instance" "private_ec2_3" {
  ami           = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.terraform_private_subnet_3.id
  
  vpc_security_group_ids = [aws_security_group.terraform_security_group.id]
  key_name = "terraform-key"

  tags = {
    Name = "private_ec2_3"
  }
}