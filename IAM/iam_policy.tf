resource "aws_iam_policy" "example_policy-1" {
  name        = "example-s3-read-policy-1"
  description = "Allow read-only access to an S3 bucket"
  policy      = file("s3-read-policy.json")  # Specify the path to your policy JSON file
}


resource "aws_iam_policy" "example_policy-2" {
  name        = "example-s3-read-policy-2"
  description = "Allow read-only access to an S3 bucket"
  policy      = file("s3-read-policy2.json")  # Specify the path to your policy JSON file
}

#attach to multiple role
resource "aws_iam_policy_attachment" "example_attachment-roles" {
  name       = "example-attachment-roles"
  roles      = [aws_iam_role.example_role.name]
  policy_arn = aws_iam_policy.example_policy-1.arn
}

#attach to multiple group
resource "aws_iam_policy_attachment" "example_attachment-groups" {
  name       = "example-attachment-groups"
  groups =  [aws_iam_group.example_group.name]
  policy_arn = aws_iam_policy.example_policy-2.arn
}

#custom policy attachment for user
resource "aws_iam_user_policy_attachment" "example_policy_attachment-1" {
  user       = aws_iam_user.example_user.name
  policy_arn = aws_iam_policy.example_policy-1.arn
}

resource "aws_iam_user_policy_attachment" "example_policy_attachment-2" {
  user       = aws_iam_user.example_user.name
  policy_arn = aws_iam_policy.example_policy-2.arn
}


#inline policy attachment for user
resource "aws_iam_user_policy" "lb_ro" {
  name = "test"
  user = aws_iam_user.example_user.name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}


#inline policy for role
resource "aws_iam_role_policy" "role-inline" {
  name = "test"
  role = aws_iam_role.example_role.name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

