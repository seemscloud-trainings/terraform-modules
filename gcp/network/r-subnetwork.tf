resource "google_compute_subnetwork" "main" {
  for_each                         = local.subnetworks
  allow_subnet_cidr_routes_overlap = each.value.allow_subnet_cidr_routes_overlap
  deletion_policy                  = each.value.deletion_policy
  description                      = each.value.description
  external_ipv6_prefix             = each.value.external_ipv6_prefix
  internal_ipv6_prefix             = each.value.internal_ipv6_prefix
  ip_cidr_range                    = each.value.ip_cidr_range
  ip_collection                    = each.value.ip_collection
  ipv6_access_type                 = each.value.ipv6_access_type
  name                             = each.value.name
  network                          = each.value.network != null ? each.value.network : google_compute_network.main.self_link
  private_ip_google_access         = each.value.private_ip_google_access
  private_ipv6_google_access       = each.value.private_ipv6_google_access
  project                          = each.value.project != null ? each.value.project : local.network.project
  purpose                          = each.value.purpose
  region                           = each.value.region
  reserved_internal_range          = each.value.reserved_internal_range
  resolve_subnet_mask              = each.value.resolve_subnet_mask
  role                             = each.value.role
  send_secondary_ip_range_if_empty = each.value.send_secondary_ip_range_if_empty
  stack_type                       = each.value.stack_type

  dynamic "log_config" {
    for_each = each.value.log_config == null ? [] : [each.value.log_config]
    content {
      aggregation_interval = log_config.value.aggregation_interval
      filter_expr          = log_config.value.filter_expr
      flow_sampling        = log_config.value.flow_sampling
      metadata             = log_config.value.metadata
      metadata_fields      = log_config.value.metadata_fields
    }
  }

  dynamic "params" {
    for_each = each.value.params == null ? [] : [each.value.params]
    content {
      resource_manager_tags = params.value.resource_manager_tags
    }
  }

  dynamic "secondary_ip_range" {
    for_each = each.value.secondary_ip_range == null ? [] : each.value.secondary_ip_range
    content {
      ip_cidr_range           = secondary_ip_range.value.ip_cidr_range
      range_name              = secondary_ip_range.value.range_name
      reserved_internal_range = secondary_ip_range.value.reserved_internal_range
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts == null ? [] : [each.value.timeouts]
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}
