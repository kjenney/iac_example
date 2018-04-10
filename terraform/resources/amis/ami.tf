# Custom AMIs built on Centos 7
data "aws_ami" "web" {
  most_recent      = true

  filter {
    name   = "name"
    values = ["webserver*"]
  }

  owners     = ["self"]
}
