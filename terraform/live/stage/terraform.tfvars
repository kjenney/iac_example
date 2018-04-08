### This is a single Variable Defintion file for the Stage environment  ###

include = "amis,jump,keypair,route,security_groups,vpc"

aws_region = "us-east-2"
aws_ami = "ami-994575fc"
aws_key_name = "qa"
aws_vpc_cidr = "10.0.0.0/16"
aws_cidr_1 = "10.0.1.0/24"
aws_cidr_2 = "10.0.2.0/24"

## Jump Server

jump_instance_count = 1
jump_instance_type = "t2.micro"


## MySQL

mysql_instance_count = 1
mysql_instance_type = "t2.micro"
