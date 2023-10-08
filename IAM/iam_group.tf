resource "aws_iam_group" "example_group" {
  name = "example-group"
}


resource "aws_iam_group_membership" "example_membership" {
  name = "development-group-membership"
  users = [aws_iam_user.example_user.name]
  group = aws_iam_group.example_group.name
}
