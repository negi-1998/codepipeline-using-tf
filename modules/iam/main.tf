resource "aws_iam_role" "ec2_for_codedeploy_role" {
  name = "ec2_for_codedeploy_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy" "ec2_for_codedeploy_policy" {
  name = "ec2_codedeploy_full_access"
  role = aws_iam_role.ec2_for_codedeploy_role.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect   = "Allow",
      Action   = ["codedeploy:*", "s3:*", "ec2:*", "cloudwatch:*", "autoscaling:*"],
      Resource = "*"
    }]
  })
}

resource "aws_iam_instance_profile" "ec2_codedeploy_instance_profile" {
  name = "ec2_codedeploy_instance_profile"
  role = aws_iam_role.ec2_for_codedeploy_role.name
}

resource "aws_iam_role" "codebuild_role" {
  name = "codebuild_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "codebuild.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy" "codebuild_role_policy" {
  name = "codebuild_policy"
  role = aws_iam_role.codebuild_role.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = ["ssm:GetParameter", "ssm:GetParameters", "ssm:GetParameterHistory"],
        Effect = "Allow",
        Resource = [
          "arn:aws:ssm:${var.region}:${var.account_id}:parameter/myapp/dockerCredentials/username",
          "arn:aws:ssm:${var.region}:${var.account_id}:parameter/myapp/dockerCredentials/password",
          "arn:aws:ssm:${var.region}:${var.account_id}:parameter/myapp/dockerRegistry/url"
        ]
      },
      {
        Action = ["s3:GetObject", "s3:PutObject", "s3:ListBucket", "s3:PutObjectAcl"],
        Effect = "Allow",
        Resource = ["${var.artifact_bucket_arn}", "${var.artifact_bucket_arn}/*"]
      },
      {
        Action = ["codedeploy:*"],
        Effect = "Allow",
        Resource = "*"
      },
      {
        Action = ["logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents"],
        Effect = "Allow",
        Resource = "arn:aws:logs:${var.region}:${var.account_id}:log-group:/aws/codebuild/*"
      }
    ]
  })
}

resource "aws_iam_role" "codedeploy_role" {
  name = "codedeploy_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "codedeploy.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy" "codedeploy_role_policy" {
  name = "codedeploy_policy"
  role = aws_iam_role.codedeploy_role.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = ["ec2:*", "s3:*", "codedeploy:*"],
      Effect = "Allow",
      Resource = "*"
    }]
  })
}

resource "aws_iam_role" "codepipeline_role" {
  name = "codepipeline_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "codepipeline.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy" "codepipeline_role_policy" {
  name = "codepipeline_policy"
  role = aws_iam_role.codepipeline_role.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = ["s3:*", "codebuild:*", "codedeploy:*", "codepipeline:*", "iam:PassRole", "cloudwatch:*"],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}

