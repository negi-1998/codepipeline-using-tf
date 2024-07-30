output "iam_roles" {
  value = module.iam
}

output "s3_buckets" {
  value = module.s3
}

output "ec2_instance_ids" {
  value = module.ec2.instance_ids
}

output "codebuild_project" {
  value = module.codebuild
}

output "codedeploy_app" {
  value = module.codedeploy
}

output "codepipeline" {
  value = module.codepipeline
}

