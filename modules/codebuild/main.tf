resource "aws_codebuild_project" "my_codebuild_project" {
  name          = var.name
  build_timeout = 20

  source {
    type           = "GITHUB"
    location       = var.source_location
    buildspec      = var.buildspec
    git_clone_depth = 1
  }

  artifacts {
    type     = "S3"
    location = var.artifact_location
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:5.0"
    type         = "LINUX_CONTAINER"
  }

  service_role = var.service_role_arn
}

