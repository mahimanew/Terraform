resource "aws_instance" "example" {
  #ami           = "ami-053b0d53c279acc90" # Ubuntu AMI ID
  ami = "ami-01c438c8668b1136b" #my custom ami id
  instance_type = "t2.micro"             # Change to your desired instance type
  key_name      = "deployer-key"
  vpc_security_group_ids = [aws_security_group.example.id]
  #user_data = file("script.sh")
}



