variable "directory_tag" {
  description = "What do you want to tag for the directory?"
}

resource "aws_directory_service_directory" "simple" {
  name     = "corp.example.com"
  password = "SuperSecretPassw0rd"
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
