resource "aws_ssm_parameter" "docker_credentials_username" {
  name  = "/myapp/dockerCredentials/username"
  type  = "SecureString"
  value = ""  # replace with your actual username
}

resource "aws_ssm_parameter" "docker_credentials_password" {
  name  = "/myapp/dockerCredentials/password"
  type  = "SecureString"
  value = ""  # replace with your actual password
  depends_on = [aws_ssm_parameter.docker_credentials_username] 
}

resource "aws_ssm_parameter" "docker_registry_url" {
  name  = "/myapp/dockerRegistry/url"
  type  = "SecureString"
  value = "docker.io"  # replace with your actual docker registry URL
  depends_on = [aws_ssm_parameter.docker_credentials_password]  
}
