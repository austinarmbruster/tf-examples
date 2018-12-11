resource "aws_security_group" "reverse-proxy" {
  name        = "reverse-proxy-group"
  description = "Reverse Proxy: HTTP & SSH from Bastion"

  vpc_id = "${data.aws_vpc.reverse-proxy.id}"

  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }

  ingress {
    from_port       = "22"
    to_port         = "22"
    protocol        = "tcp"
    security_groups = ["${aws_security_group.bastion.id}"]
    self            = true
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "reverse-proxy"
  }
}

resource "aws_security_group" "bastion" {
  name        = "bastion-group"
  description = "Bastion: SSH"

  vpc_id = "${data.aws_vpc.bastion.id}"

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "bastion"
  }
}
