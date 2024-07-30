variable "role_arn" {
  description = "Role ARN for CodePipeline"
}

variable "artifact_bucket" {
  description = "S3 bucket for CodePipeline artifacts"
}

variable "source_bucket" {
  description = "S3 bucket for CodePipeline source artifacts"
}

variable "codebuild_project_name" {
  description = "CodeBuild project name"
}

variable "codedeploy_app_name" {
  description = "CodeDeploy application name"
}

variable "codedeploy_group_name" {
  description = "CodeDeploy deployment group name"
}

