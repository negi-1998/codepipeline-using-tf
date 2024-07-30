resource "aws_codedeploy_app" "my_codedeploy_app" {
  name = "MyCodeDeployApplication"
}

resource "aws_codedeploy_deployment_group" "my_deployment_group" {
  app_name               = aws_codedeploy_app.my_codedeploy_app.name
  deployment_group_name  = "MyDeploymentGroup"
  service_role_arn       = var.service_role_arn
  deployment_config_name = "CodeDeployDefault.OneAtATime"

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }

  ec2_tag_set {
    ec2_tag_filter {
      key   = var.ec2_tag_key
      type  = "KEY_AND_VALUE"
      value = var.ec2_tag_value
    }
  }
}

