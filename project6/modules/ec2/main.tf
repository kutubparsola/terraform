provider "aws" {
  region = "us-east-1"
}
variable "ami" {
  description = "ami value"
}
variable "instance_test" {
  description = "instance type in an env"
}
resource "aws_instance" "example1" {
  region        = "us-east-1"
  ami           = var.ami
  instance_type = var.instance_test
  tags = {
    name = "helloworld"
  }
}
