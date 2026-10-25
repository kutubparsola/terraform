provider "aws" {
  region = "us-east-1"
}

variable "ami" {
  description = "ami type "
}

variable "instance_type" {
  description = " instance type "
  type        = map(string)

  default = {
    "prod"  = "t2.micro"
    "stage" = "t3.micro"
    "dev"   = "t3.xlarge"
  }
}

module "ec2_module" {
  source        = "./modules/ec2"
  ami           = var.ami
  instance_test = lookup(var.instance_type, terraform.workspace, "t2.micro")
}
