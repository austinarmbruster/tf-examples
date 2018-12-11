/*
resource "aws_route" "world-to-igw" {
  route_table_id         = "${data.aws_vpc.reverse-proxy.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_nat_gateway.internal-out.id}"
}
*/

resource "aws_route_table" "to-world" {
  vpc_id = "${data.aws_vpc.reverse-proxy.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.to-world.id}"
  }

  tags {
    Name = "to-world"
  }
}

resource "aws_route_table_association" "reverse-proxy-a" {
  subnet_id      = "${aws_subnet.reverse-proxy-a.id}"
  route_table_id = "${aws_route_table.to-world.id}"
}

resource "aws_route_table" "from-world" {
  vpc_id = "${data.aws_vpc.bastion.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.from-world.id}"
  }

  tags {
    Name = "from-world"
  }
}

resource "aws_route_table_association" "bastion-a-public" {
  subnet_id      = "${aws_subnet.bastion-a.id}"
  route_table_id = "${aws_route_table.from-world.id}"
}

resource "aws_route_table_association" "bastion-b-public" {
  subnet_id      = "${aws_subnet.bastion-b.id}"
  route_table_id = "${aws_route_table.from-world.id}"
}

resource "aws_route_table_association" "reverse-proxy-a-public" {
  subnet_id      = "${aws_subnet.reverse-proxy-public-a.id}"
  route_table_id = "${aws_route_table.from-world.id}"
}

resource "aws_route_table_association" "reverse-proxy-b-public" {
  subnet_id      = "${aws_subnet.reverse-proxy-public-b.id}"
  route_table_id = "${aws_route_table.from-world.id}"
}
