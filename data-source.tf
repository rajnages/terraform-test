#taking vpc existing in the account
data "aws_vpc" "terraform_vpc" {
  id = "vpc-00e5b3721b3c0a673"
}

#added internet gateway existing in the vpc
resource "aws_internet_gateway" "test_sample_igw" {
  vpc_id = data.aws_vpc.terraform_vpc.id

  tags = {
    Name = "terraform_igw_testing"
  }
}