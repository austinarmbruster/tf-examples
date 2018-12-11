module "bastion" {
  source = "git@github.com:austinarmbruster/tf-mods.git?ref=v0.2.0//bastion"

  providers = {
    aws = "aws"
  }

  key-name = "${var.key-name}"
  vpc-tag  = "${var.vpc-tag}"
}
