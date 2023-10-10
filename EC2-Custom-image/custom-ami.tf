resource "aws_ami_from_instance" "custom-ami-example" {
  name               = "my-custom-ami"
  source_instance_id = "i-07504004b92b18ef7"
}