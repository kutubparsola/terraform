provider "aws" {
  region = "us-east-1"
}

/*resource "aws_instance" "example" {
  ami = "ami-0d97d7f07b25dd693"
  # associate_public_ip_address        = true
  availability_zone                    = "us-east-1d"
  disable_api_stop                     = false
  disable_api_termination              = false
  ebs_optimized                        = false
  force_destroy                        = false
  get_password_data                    = false
  hibernation                          = false
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t2.nano"
  # ipv6_address_count                 = 0
  # ipv6_addresses                     = []
  key_name                   = "python-key"
  monitoring                 = false
  placement_partition_number = 0
  # private_ip                         = "172.31.40.82"
  # region                             = "us-east-1"
  # secondary_private_ips              = []
  # security_groups                    = ["helloworld"]
  # source_dest_check                  = true
  # subnet_id                          = "subnet-0106959394e12744e"

  tags = {
    Name = "helloworld"
  }
  tags_all = {
    Name = "helloworld"
  }

  tenancy                     = "default"
  user_data                   = null
  user_data_replace_on_change = null
  volume_tags                 = null
  # vpc_security_group_ids             = ["sg-0eb955a2001050f3f"]

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }
  cpu_options {
    core_count       = 1
    threads_per_core = 1
  }
  credit_specification {
    cpu_credits = "standard"
  }
  enclave_options {
    enabled = false
  }
  maintenance_options {
    auto_recovery = "default"
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }
  primary_network_interface {
    network_interface_id = "eni-063998be5927ca2e2"
  }
  private_dns_name_options {
    enable_resource_name_dns_a_record    = true
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    iops                  = 3000
    tags                  = {}
    tags_all              = {}
    throughput            = 125
    volume_size           = 8
    volume_type           = "gp3"
  }
}*/

/*resource "aws_security_group" "example" {
  description = "launch-wizard-1 created 2026-10-25T14:11:25.823Z"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["43.242.116.192/32"]
    description      = ""
    from_port        = 22
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 22
  }]
  name                   = "helloworld"
  region                 = "us-east-1"
  revoke_rules_on_delete = null
  tags                   = {}
  tags_all               = {}
  vpc_id                 = "vpc-01c9c3a2a96bda1d5"
}*/

import {
  id = //"id of the instance"

  to = aws_instance.example1
}

import {
  id = //"id of sg"

  to = aws_security group.example1
}

import {
  id = //"python-key"

  to = aws_key_pair.example1
}

// here are few things to keep in mind the import is used to import the configuration of an existing resources in the terraform and saving the configs and state file. now here are the steps which are above mention as import cmd which just exports the configs. you pass this block of code then go to terminal then pass cmd terraform plan -generate-config-out=generate.tf this will create the file with the configs now remove two things 1st the import block from the code then the generate.tf after copy pasting its content in main.tf then pass cmd terraform import {resource typy eg:- aws_instance.example which you gave in import block previously} then id of the resource now 2 things to remember 1st while configuring the instance it will through some error so you have to cmt few line which is done above and 2ndly in the sg you have to mention the sg name instead of id and also need to mention public key which we didnt did now but you can prac in future
