resource "aws_launch_configuration" "reverse-proxy" {
  name_prefix = "reverse-proxy-"

  image_id  = "${data.aws_ami.ubuntu.id}"
  user_data = "${file("simple-apache.ud")}"

  instance_type = "t2.micro"

  security_groups = ["${aws_security_group.reverse-proxy.id}"]

  key_name = "${aws_key_pair.deployer.key_name}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "reverse-proxy-a" {
  name                 = "reverse-proxy"
  launch_configuration = "${aws_launch_configuration.reverse-proxy.name}"
  min_size             = 2
  max_size             = 4

  vpc_zone_identifier = ["${aws_subnet.reverse-proxy-a.id}", "${aws_subnet.reverse-proxy-b.id}"]

  load_balancers = ["${aws_elb.reverse-proxy-elb.id}"]

  lifecycle {
    create_before_destroy = true
  }
}
