data "aws_vpc" "bastion" {
  filter {
    name   = "tag:bastion"
    values = [true]
  }
}

data "aws_vpc" "reverse-proxy" {
  filter {
    name   = "tag:reverseProxy"
    values = [true]
  }
}
