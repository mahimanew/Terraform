

resource "aws_iam_user" "example_user" {
  name = "example-iam-user"  # Specify the desired IAM user name
  
}

resource "aws_iam_access_key" "example_access_key" {
  user = aws_iam_user.example_user.name
}

output "secret_access_key" {
  value = aws_iam_access_key.example_access_key.secret
  sensitive = true
}
# use this below command to retive secret key
#terraform output secret_access_key

