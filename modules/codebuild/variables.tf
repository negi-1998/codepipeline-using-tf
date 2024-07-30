variable "name" {
  description = "CodeBuild project name"
}

variable "source_location" {
  description = "Source location for CodeBuild"
}

variable "buildspec" {
  description = "Buildspec file for CodeBuild"
}

variable "artifact_location" {
  description = "S3 location for build artifacts"
}

variable "service_role_arn" {
  description = "Service role ARN for CodeBuild"
}

