resource "aws_route_table" "world-to-app" {
  vpc_id = "${aws_vpc.app.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.world-to-app.id}"
  }

  tags {
    Name = "world-to-app"
  }
}
