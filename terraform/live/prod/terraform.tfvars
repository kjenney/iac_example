### This is a single Variable Defintion file for the PROD environment  ###

include = "amis,directory,iam,jump,keypair,route,security_groups,vpc"

aws_region = "us-east-1"
aws_key_name = "prod"
aws_vpc_cidr = "10.0.0.0/16"
aws_cidr_1 = "10.0.1.0/24"
aws_cidr_2 = "10.0.2.0/24"

## Jump Server

jump_instance_count = 1
jump_instance_type = "t2.micro"

## MySQL

mysql_instance_count = 3
mysql_instance_type = "t2.micro"

## Directory

directory_tag = "terraform"