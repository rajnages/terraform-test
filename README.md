# terraform code to create a vpc, internet gateway, public subnet, public route table, 
# and public route table association and security group
# This is a key difference between public and private subnets in AWS
# Any EC2 instance launched in these public subnets will automatically get a public IP address
# Private subnets don't have this setting, so instances there will only get private IPs
# # Generate key pair
# ssh-keygen -t rsa -b 2048 -f my-key-pair
# This will create:
# - my-key-pair (private key)
# - my-key-pair.pub (public key)