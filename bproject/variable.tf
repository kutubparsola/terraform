variable "cidr" {
  description = "value of main cidr block "
  default     = "10.0.0.0/16"
}

variable "sub1cidr" {
  description = "value of cidr in sub1"
  default     = "10.0.1.0/24"
}

variable "sub2cidr" {
  description = "value of cidr in sub1"
  default     = "10.0.2.0/24"
}
variable "ami" {
  description = "ami value"
  default = "ami-0d97d7f07b25dd693"
}
variable "instanceType" {
  description = "server instance type"
  default = "t3.micro"
}
