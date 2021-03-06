variable "directory_tag" {
  description = "What do you want to tag for the directory?"
}

variable "directory_password" {
  description = "The Simple AD password."
}

variable "directory_name" {
  description = "The name of the AD."
}

resource "aws_directory_service_directory" "simple" {
  name     = "${var.directory_name}"
  password = "${var.directory_password}"
  size     = "Small"

  vpc_settings {
    vpc_id     = "${aws_vpc.terraform.id}"
    subnet_ids = ["${aws_subnet.subnet-1.id}", "${aws_subnet.subnet-2.id}"]
  }

  tags {
    Project = "${var.directory_tag}"
  }
}

/*
  OUTPUT
*/
output "Directory URL" {
  value = "${aws_directory_service_directory.simple.access_url}"
}
