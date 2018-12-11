resource "aws_vpc" "app" {
  cidr_block = "10.1.0.0/24"

  tags {
    Name         = "app"
    reverseProxy = true
    webService   = true
    dataStore    = true
    bastion      = true
    dataFeed     = true
    elk          = true
  }
}
