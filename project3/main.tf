provider "aws" {
  region = "us-east-1"
}

module "my_ec2" {
  source        = "./modules/aws-web"
  instance_id   = "ami-0d27e0fb3bac4d724"
  instance_type = "t2.micro"
}

module "my_ec2_2" {
  source        = "./modules/aws-web"
  instance_id   = "ami-0d27e0fb3bac4d724"
  instance_type = "t2.micro"
}

output "ip" {
  value = module.my_ec2.pub_ipe
}
output "ip2" {
  value = module.my_ec2_2.pub_ip
}
