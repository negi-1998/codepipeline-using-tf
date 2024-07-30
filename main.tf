provider "aws" {
  region = var.region
}

module "iam" {
  source = "./modules/iam"
  account_id = var.account_id
  region = var.region
  artifact_bucket_arn = module.s3.artifact_bucket_arn
}

module "s3" {
  source = "./modules/s3"
}

module "ec2" {
  source = "./modules/ec2"
  iam_instance_profile = module.iam.ec2_instance_profile
}

module "ssmParameter" {
  source = "./modules/ssmParameter"
}

module "codebuild" {
  source = "./modules/codebuild"
  service_role_arn = module.iam.codebuild_role_arn
  artifact_location = module.s3.artifact_bucket_name
  source_location = "https://github.com/negi-1998/aws-devops-zero-to-hero.git"
  buildspec = "buildspec.yml"
  name = "MyCodeBuildProject"
}

module "codedeploy" {
  source = "./modules/codedeploy"
  service_role_arn = module.iam.codedeploy_role_arn
  ec2_tag_key = "Name"
  ec2_tag_value = "ec2_for_codedeploy"
}

module "codepipeline" {
  source = "./modules/codepipeline"
  role_arn = module.iam.codepipeline_role_arn
  artifact_bucket = module.s3.artifact_bucket_name
  source_bucket = module.s3.source_bucket_name
  codebuild_project_name = module.codebuild.project_name
  codedeploy_app_name = module.codedeploy.app_name
  codedeploy_group_name = module.codedeploy.deployment_group_name
}

