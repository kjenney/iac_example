# Centos 7 AMIs
variable "aws_amis" {
  default = {
    us-east-1 = "ami-02e98f78",
    us-east-2 = "ami-994575fc",
    us-west-1 = "ami-65e0e305"
  }
}
