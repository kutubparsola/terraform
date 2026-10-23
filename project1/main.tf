provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "instance1" {
  ami           = "ami-0d27e0fb3bac4d724"
  instance_type = "t2.micro"
  tags = {
    Name = "HelloWorld"
  }
}

output "instance-ip" {
  value = aws_instance.instance1.public_ip
}
