variable "service_role_arn" {
  description = "Service role ARN for CodeDeploy"
}

variable "ec2_tag_key" {
  description = "EC2 instance tag key for identifying deployment targets"
}

variable "ec2_tag_value" {
  description = "EC2 instance tag value for identifying deployment targets"
}

