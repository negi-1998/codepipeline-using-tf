output "artifact_bucket_arn" {
  description = "The ARN of the artifact S3 bucket"
  value       = aws_s3_bucket.codepipeline_bucket.arn
}

output "artifact_bucket_name" {
  description = "The name of the artifact S3 bucket"
  value       = aws_s3_bucket.codepipeline_bucket.bucket
}

output "source_bucket_name" {
  description = "The name of the source S3 bucket"
  value       = aws_s3_bucket.codepipeline_source_code_bucket.bucket
}


