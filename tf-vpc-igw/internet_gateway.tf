resource "aws_internet_gateway" "world-to-app" {
  vpc_id = "${aws_vpc.app.id}"

  tags {
    Name = "world-to-app"
  }
}
