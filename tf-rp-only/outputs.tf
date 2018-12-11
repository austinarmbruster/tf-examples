output "reverse-proxy-elb" {
  value = "${aws_elb.reverse-proxy-elb.dns_name}"
}
