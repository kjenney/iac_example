# Everything needed to route traffic in the VPC

/*
  Internet Gateway
*/
resource "aws_internet_gateway" "terraform" {
  vpc_id = "${aws_vpc.terraform.id}"

  tags {
    Name = "terraform"
  }
}

/*
  Route Table
*/
resource "aws_route_table" "terraform" {
  vpc_id = "${aws_vpc.terraform.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.terraform.id}"
  }

  tags {
    Name = "terraform"
  }
}


/*
  Subnets
*/
resource "aws_subnet" "subnet-1" {
    vpc_id = "${aws_vpc.terraform.id}"

    cidr_block = "${var.aws_cidr_1}"
    availability_zone = "${var.aws_region}b"

    tags {
        Name = "Subnet 1"
    }
}

resource "aws_subnet" "subnet-2" {
    vpc_id = "${aws_vpc.terraform.id}"

    cidr_block = "${var.aws_cidr_2}"
    availability_zone = "${var.aws_region}c"

    tags {
        Name = "Subnet 2"
    }
}

/*
  Associate Route Tables with Subnets
*/
resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.subnet-1.id}"
  route_table_id = "${aws_route_table.terraform.id}"
}

resource "aws_route_table_association" "b" {
  subnet_id      = "${aws_subnet.subnet-2.id}"
  route_table_id = "${aws_route_table.terraform.id}"
}
