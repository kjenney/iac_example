variable "aws_cidr_1" {}
variable "aws_cidr_2" {}

variable "aws_vpc_cidr" {
  description = "Which IP range to use for the VPC"
}

variable "aws_region" {
  description = "Which region are we provisioning for?"
}

variable "home_ip" {
  description = "Where are you connecting from?"
}

provider "aws" {
  region = "${var.aws_region}"
  version = "~> 1.13"
}

resource "aws_vpc" "terraform" {
    cidr_block = "${var.aws_vpc_cidr}"
    enable_dns_hostnames = true
    tags {
        Name = "terraform-aws-vpc"
    }
}

/*
  OUTPUT
*/
output "AWS VPC" {
  value = "${aws_vpc.terraform.id}"
}