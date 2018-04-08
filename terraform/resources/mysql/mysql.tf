variable "mysql_instance_count" {
  description = "How many servers to run"
}

variable "mysql_instance_type" {
  description = "What kind of servers to run (e.g. t2.large)"
}

resource "aws_instance" "mysql" {
  count = "${var.mysql_instance_count}"

  tags {
    Name = "${format("mysql-%03d", count.index + 1)}"
    sshUser = "centos"
    group = "mysql"
  }

  connection {
    user = "centos"
    private_key = "${file("./id_rsa")}"
  }

  root_block_device {
    delete_on_termination = true
  }
  
  instance_type = "${var.mysql_instance_type}"

  ami = "${lookup(var.aws_amis, var.aws_region)}"
 
  associate_public_ip_address = true

  key_name = "${aws_key_pair.terraform.id}"

  subnet_id = "${aws_subnet.subnet-1.id}"

  vpc_security_group_ids = ["${aws_security_group.jump.id}"]
}
