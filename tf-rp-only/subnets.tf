resource "aws_subnet" "reverse-proxy-public-a" {
  vpc_id = "${data.aws_vpc.reverse-proxy.id}"

  cidr_block = "10.1.1.0/25"

  map_public_ip_on_launch = true

  availability_zone = "${var.az-a}"

  tags {
    Name = "reverse-proxy-public-a"
  }
}

resource "aws_subnet" "reverse-proxy-public-b" {
  vpc_id = "${data.aws_vpc.reverse-proxy.id}"

  cidr_block = "10.1.1.128/25"

  map_public_ip_on_launch = true

  availability_zone = "${var.az-b}"

  tags {
    Name = "reverse-proxy-public-b"
  }
}

resource "aws_subnet" "reverse-proxy-a" {
  vpc_id = "${data.aws_vpc.reverse-proxy.id}"

  cidr_block = "10.1.0.0/25"

  availability_zone = "${var.az-a}"

  tags {
    Name = "reverse-proxy-a"
  }
}

resource "aws_subnet" "reverse-proxy-b" {
  vpc_id = "${data.aws_vpc.reverse-proxy.id}"

  cidr_block = "10.1.0.128/25"

  availability_zone = "${var.az-b}"

  tags {
    Name = "reverse-proxy-b"
  }
}

resource "aws_subnet" "bastion-a" {
  vpc_id = "${data.aws_vpc.bastion.id}"

  cidr_block = "10.1.2.0/25"

  map_public_ip_on_launch = true

  availability_zone = "${var.az-a}"

  tags {
    Name = "bastion-a"
  }
}

resource "aws_subnet" "bastion-b" {
  vpc_id = "${data.aws_vpc.bastion.id}"

  cidr_block = "10.1.2.128/25"

  map_public_ip_on_launch = true

  availability_zone = "${var.az-b}"

  tags {
    Name = "bastion-b"
  }
}
