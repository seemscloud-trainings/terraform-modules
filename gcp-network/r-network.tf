resource "google_compute_network" "main" {
  auto_create_subnetworks                   = local.network.auto_create_subnetworks
  bgp_always_compare_med                    = local.network.bgp_always_compare_med
  bgp_best_path_selection_mode              = local.network.bgp_best_path_selection_mode
  bgp_inter_region_cost                     = local.network.bgp_inter_region_cost
  delete_bgp_always_compare_med             = local.network.delete_bgp_always_compare_med
  delete_default_routes_on_create           = local.network.delete_default_routes_on_create
  deletion_policy                           = local.network.deletion_policy
  description                               = local.network.description
  enable_ula_internal_ipv6                  = local.network.enable_ula_internal_ipv6
  internal_ipv6_range                       = local.network.internal_ipv6_range
  mtu                                       = local.network.mtu
  name                                      = local.network.name
  network_firewall_policy_enforcement_order = local.network.network_firewall_policy_enforcement_order
  network_profile                           = local.network.network_profile
  project                                   = local.network.project
  routing_mode                              = local.network.routing_mode

  dynamic "params" {
    for_each = local.network.params == null ? [] : [local.network.params]
    content {
      resource_manager_tags = params.value.resource_manager_tags
    }
  }

  dynamic "timeouts" {
    for_each = local.network.timeouts == null ? [] : [local.network.timeouts]
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}
