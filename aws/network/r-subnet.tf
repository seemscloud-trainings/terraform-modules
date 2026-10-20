resource "aws_subnet" "main" {
  for_each                                       = local.subnets
  assign_ipv6_address_on_creation                = each.value.assign_ipv6_address_on_creation
  availability_zone                              = each.value.availability_zone
  availability_zone_id                           = each.value.availability_zone_id
  cidr_block                                     = each.value.cidr_block
  customer_owned_ipv4_pool                       = each.value.customer_owned_ipv4_pool
  enable_dns64                                   = each.value.enable_dns64
  enable_lni_at_device_index                     = each.value.enable_lni_at_device_index
  enable_resource_name_dns_a_record_on_launch    = each.value.enable_resource_name_dns_a_record_on_launch
  enable_resource_name_dns_aaaa_record_on_launch = each.value.enable_resource_name_dns_aaaa_record_on_launch
  ipv4_ipam_pool_id                              = each.value.ipv4_ipam_pool_id
  ipv4_netmask_length                            = each.value.ipv4_netmask_length
  ipv6_cidr_block                                = each.value.ipv6_cidr_block
  ipv6_ipam_pool_id                              = each.value.ipv6_ipam_pool_id
  ipv6_native                                    = each.value.ipv6_native
  ipv6_netmask_length                            = each.value.ipv6_netmask_length
  map_customer_owned_ip_on_launch                = each.value.map_customer_owned_ip_on_launch
  map_public_ip_on_launch                        = each.value.map_public_ip_on_launch
  outpost_arn                                    = each.value.outpost_arn
  private_dns_hostname_type_on_launch            = each.value.private_dns_hostname_type_on_launch
  region                                         = each.value.region != null ? each.value.region : local.vpc.region
  tags                                           = each.value.tags
  tags_all                                       = each.value.tags_all
  vpc_id                                         = each.value.vpc_id != null ? each.value.vpc_id : aws_vpc.main.id

  dynamic "timeouts" {
    for_each = each.value.timeouts == null ? [] : [each.value.timeouts]
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
    }
  }
}
