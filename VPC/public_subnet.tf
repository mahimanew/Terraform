resource "aws_subnet" "public_subnet_1" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.0.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"

  tags = {
    Name = "MyPublicSubnet-1"  # Set a name for your public subnet
  }
}

resource "aws_route_table" "public_subnet_1_RT" {
  vpc_id = aws_vpc.my_vpc.id  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
  tags = {
    Name = "public-subnet-1-RT"  # Set a name for the route table of the first public subnet
  }
}

resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_subnet_1_RT.id
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1b"

  tags = {
    Name = "MyPublicSubnet-2"  # Set a name for your public subnet
  }
}

resource "aws_route_table" "public_subnet_2_RT" {
  vpc_id = aws_vpc.my_vpc.id  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
  tags = {
    Name = "public-subnet-2-RT"  # Set a name for the route table of the first public subnet
  }
}

resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_subnet_2_RT.id
}

resource "aws_network_acl" "public_NACL" {
    vpc_id = aws_vpc.my_vpc.id
    subnet_ids = [aws_subnet.public_subnet_1.id,aws_subnet.public_subnet_2.id]
    # allow port 22
  ingress {
  from_port       = 0
  to_port         = 0
  protocol        = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
  }
   

   ingress {
  from_port       = 443
  to_port         = 443
  protocol        = "tcp"
    rule_no    = 143
    action     = "allow"
    cidr_block = "0.0.0.0/0"
  }

  ingress {
  from_port       = 1024
  to_port         = 65535
  protocol        = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
  }

   ingress {
  from_port       = 1024
  to_port         = 65535
  protocol        = "udp"
    rule_no    = 201
    action     = "allow"
    cidr_block = "0.0.0.0/0"
  }

 
# allow egress ephemeral ports
  egress {

    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
  }

  
tags = {
    Name = "Public_NACL"
 

}
}