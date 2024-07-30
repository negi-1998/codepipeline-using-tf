resource "aws_instance" "ec2_for_codedeploy" {
  ami           = "ami-0ad21ae1d0696ad58"
  instance_type = "t2.micro"
  tags = {
    Name = "ec2_for_codedeploy"
  }
  iam_instance_profile = var.iam_instance_profile
  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update -y
    sudo apt install ruby-full -y
    sudo apt install wget -y
    sudo apt install docker.io -y
    cd /home/ubuntu
    wget https://aws-codedeploy-ap-south-1.s3.ap-south-1.amazonaws.com/latest/install
    chmod +x ./install
    sudo ./install auto
    systemctl start codedeploy-agent
  EOF
}

