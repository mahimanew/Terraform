

resource "aws_iam_role" "example_role" {
  name = "example-iam-role"  # Specify the desired IAM role name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"  # Replace with the AWS service that assumes this role
        },
        Action = "sts:AssumeRole",
      },
    ],
  })
}



