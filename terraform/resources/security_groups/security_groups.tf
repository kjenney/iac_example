/*
  Security Groups
*/
resource "aws_security_group" "ldap" {
  description = "Allow TLS ports 636"
  vpc_id      = "${aws_vpc.terraform.id}"

  ingress {
      from_port = 636
      to_port = 636
      protocol = "tcp"
      cidr_blocks = ["${var.aws_cidr_1}","${var.aws_cidr_2}"]
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "jump" {
  description = "Allow SSH on port 22"
  vpc_id      = "${aws_vpc.terraform.id}"

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["${var.aws_cidr_1}","${var.aws_cidr_2}"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["${var.home_ip}"]
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}
