resource "aws_nat_gateway" "to-world" {
  allocation_id = "${aws_eip.to-world.id}"
  subnet_id     = "${aws_subnet.reverse-proxy-public-a.id}"
}
