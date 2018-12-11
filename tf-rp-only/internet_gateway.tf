resource "aws_internet_gateway" "from-world" {
  vpc_id = "${data.aws_vpc.reverse-proxy.id}"

  tags {
    Name = "from-world"
  }
}
