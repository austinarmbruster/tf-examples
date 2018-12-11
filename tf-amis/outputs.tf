output "amazon-ami" {
  value = "${data.aws_ami.aws_linux.id}"
}

output "centos-ami" {
  value = "${data.aws_ami.centos7.id}"
}
