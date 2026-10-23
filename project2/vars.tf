variable "aws_region_value" {
  description = "aws ka region"
  type        = string
  default     = "us-east-1"
}

variable "ami_value" {
  description = "value of the ami "
  type        = string
  default     = "ami-0d27e0fb3bac4d724"
}

variable "value_of_instance_type" {
  default = "t2.micro"
  type    = string
}

variable "value_of_instance_type2" {
  default = "t3.micro"
  type    = string
}

variable "name1" {
  type    = string
  default = "hello1"
}

variable "name2" {
  type    = string
  default = "hello2"
}
