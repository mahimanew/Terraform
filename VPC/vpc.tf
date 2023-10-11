resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"  # Set your desired VPC CIDR block
  tags = {
    Name = "MyVPC"  # Set the desired name for your VPC
  }
}
