resource "aws_s3_bucket" "codepipeline_source_code_bucket" {
  bucket = "my-codepipeline-source-code-bucket"
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "codepipeline_bucket" {
  bucket = "my-codepipeline-artifacttt-bucketttt"
}

