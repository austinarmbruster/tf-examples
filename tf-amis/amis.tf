data "aws_ami" "centos7" {
  most_recent = true

  filter {
    name   = "name"
    values = ["CentOS Linux 7"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["597420781019"] # Canonical
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "aws_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] # aws
}