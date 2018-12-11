variable "access_key" {
  default = "YOUR_ACCESS_KEY"
}

variable "secret_key" {
  default = "YOUR_SECRET_KEY"
}

variable "region" {
  default = "us-east-1"
}

variable "azs" {
  type = "list"
  default = [ "us-east-1a", "us-east-1b" ]
}

variable "az-a" {
  default = "us-east-1a"
}

variable "az-b" {
  default = "us-east-1b"
}

variable "my-ami" {
  default = "ami-0123eaacaf63ed16a"
}
