output "ec2_instance_profile" {
  value = aws_iam_instance_profile.ec2_codedeploy_instance_profile.name
}

output "codebuild_role_arn" {
  value = aws_iam_role.codebuild_role.arn
}

output "codedeploy_role_arn" {
  value = aws_iam_role.codedeploy_role.arn
}

output "codepipeline_role_arn" {
  value = aws_iam_role.codepipeline_role.arn
}

