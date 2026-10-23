provider "aws" {
  region = var.aws_region_value
}

resource "aws_instance" "my_instance" {
  ami           = var.ami_value
  instance_type = var.value_of_instance_type
  tags = {
    Name = "kutub_instance"
  }
}

resource "aws_instance" "example" {
  ami           = var.ami_value
  instance_type = var.value_of_instance_type2
  tags = {
    Name = var.value_of_instance_type2 == "t3.micro" ? var.name1 : var.name2
  }
}
