provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "test_instance" {
  region        = "us-east-1"
  instance_type = "t2.micro"
  ami           = "ami-0d27e0fb3bac4d724"
  tags = {
    name = "testing"
  }
}

# resource "aws_s3_bucket" "s3_buck" {
#   bucket = "kutbuddin2005"

# }
