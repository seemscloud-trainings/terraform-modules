mock_provider "aws" {
  mock_resource "aws_vpc" {
    defaults = { id = "vpc-0123456789abcdef0" }
  }
}
variables {
  account_id  = "123456789012"
  region_name = "eu-central-1"
  vpc         = { cidr_block = "10.0.0.0/16" }
}
run "vpc_only" {
  command = plan
  assert {
    condition     = length(aws_subnet.main) == 0
    error_message = "An omitted subnet map must not create subnets."
  }
}
run "regional_vpc_and_zonal_subnets" {
  command = apply
  variables {
    vpc = {
      cidr_block           = "10.0.0.0/16"
      enable_dns_support   = true
      enable_dns_hostnames = true
      tags                 = { Name = "training" }
    }
    subnets = {
      private_a = {
        cidr_block                                  = "10.0.1.0/24"
        availability_zone                           = "eu-central-1a"
        map_public_ip_on_launch                     = false
        enable_resource_name_dns_a_record_on_launch = true
        private_dns_hostname_type_on_launch         = "resource-name"
        timeouts                                    = { create = "15m", delete = "15m" }
      }
      private_b = {
        cidr_block        = "10.0.2.0/24"
        availability_zone = "eu-central-1b"
      }
    }
  }
  assert {
    condition     = alltrue([for s in aws_subnet.main : s.vpc_id == aws_vpc.main.id])
    error_message = "Both subnets must refer to the created VPC."
  }
  assert {
    condition     = aws_subnet.main["private_a"].availability_zone != aws_subnet.main["private_b"].availability_zone
    error_message = "Subnet availability zones must be preserved."
  }
  assert {
    condition     = aws_subnet.main["private_a"].map_public_ip_on_launch == false && aws_vpc.main.enable_dns_hostnames
    error_message = "Explicit false and true arguments must reach the resources."
  }
}
run "reject_invalid_account" {
  command = plan
  variables { account_id = "invalid" }
  expect_failures = [var.account_id]
}
