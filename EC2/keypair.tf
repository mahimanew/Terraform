#use this below command to create key pair in your local machine
#ssh-keygen
#then give the key pair value as 'my-key-pair'


resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("my-key-pair.pub")
}

