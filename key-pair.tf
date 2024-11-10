# Create a new key pair
resource "aws_key_pair" "terraform_key" {
  key_name   = "terraform-key"  # Name of the key pair in AWS
  public_key = file("${path.module}/terraform-key.pub")  # Path to your public key file
}