variable "aws_key_name" {
  description = "Which keyname to use?"
}

resource "aws_key_pair" "terraform" {
  key_name = "terraform"
  public_key = "${file("id_rsa.pub")}"
}