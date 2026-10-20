resource "aws_vpc" "main" {
  assign_generated_ipv6_cidr_block     = local.vpc.assign_generated_ipv6_cidr_block
  cidr_block                           = local.vpc.cidr_block
  enable_dns_hostnames                 = local.vpc.enable_dns_hostnames
  enable_dns_support                   = local.vpc.enable_dns_support
  enable_network_address_usage_metrics = local.vpc.enable_network_address_usage_metrics
  instance_tenancy                     = local.vpc.instance_tenancy
  ipv4_ipam_pool_id                    = local.vpc.ipv4_ipam_pool_id
  ipv4_netmask_length                  = local.vpc.ipv4_netmask_length
  ipv6_cidr_block                      = local.vpc.ipv6_cidr_block
  ipv6_cidr_block_network_border_group = local.vpc.ipv6_cidr_block_network_border_group
  ipv6_ipam_pool_id                    = local.vpc.ipv6_ipam_pool_id
  ipv6_netmask_length                  = local.vpc.ipv6_netmask_length
  region                               = local.vpc.region
  tags                                 = local.vpc.tags
  tags_all                             = local.vpc.tags_all
}
