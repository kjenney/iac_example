# Custom AMIs built on Centos 7
data "aws_ami" "web" {
  most_recent      = true

  filter {
    name   = "name"
    values = ["webserver*"]
  }

  owners     = ["self"]
}

data "aws_ami" "base" {
  most_recent      = true

  filter {
    name   = "name"
    values = ["base*"]
  }

  owners     = ["self"]
}