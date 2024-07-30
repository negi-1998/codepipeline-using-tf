output "instance_ids" {
  value = aws_instance.ec2_for_codedeploy.*.id
}

