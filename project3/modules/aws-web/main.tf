provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "instance1" {
  ami           = var.instance_id
  instance_type = var.instance_type
  tags = {
    Name = "terraform"
  }
}
