output "network" {
  description = "Resource attributes, excluding deprecated provider fields."
  value = {
    auto_create_subnetworks                   = google_compute_network.main.auto_create_subnetworks
    bgp_always_compare_med                    = google_compute_network.main.bgp_always_compare_med
    bgp_best_path_selection_mode              = google_compute_network.main.bgp_best_path_selection_mode
    bgp_inter_region_cost                     = google_compute_network.main.bgp_inter_region_cost
    delete_bgp_always_compare_med             = google_compute_network.main.delete_bgp_always_compare_med
    delete_default_routes_on_create           = google_compute_network.main.delete_default_routes_on_create
    deletion_policy                           = google_compute_network.main.deletion_policy
    description                               = google_compute_network.main.description
    enable_ula_internal_ipv6                  = google_compute_network.main.enable_ula_internal_ipv6
    gateway_ipv4                              = google_compute_network.main.gateway_ipv4
    id                                        = google_compute_network.main.id
    internal_ipv6_range                       = google_compute_network.main.internal_ipv6_range
    mtu                                       = google_compute_network.main.mtu
    name                                      = google_compute_network.main.name
    network_firewall_policy_enforcement_order = google_compute_network.main.network_firewall_policy_enforcement_order
    network_id                                = google_compute_network.main.network_id
    network_profile                           = google_compute_network.main.network_profile
    project                                   = google_compute_network.main.project
    routing_mode                              = google_compute_network.main.routing_mode
    self_link                                 = google_compute_network.main.self_link
    params                                    = google_compute_network.main.params
    timeouts                                  = google_compute_network.main.timeouts
  }
}

output "subnetworks" {
  description = "Resource attributes, excluding deprecated provider fields."
  value = { for key, resource in google_compute_subnetwork.main : key => {
    allow_subnet_cidr_routes_overlap = resource.allow_subnet_cidr_routes_overlap
    creation_timestamp               = resource.creation_timestamp
    deletion_policy                  = resource.deletion_policy
    description                      = resource.description
    external_ipv6_prefix             = resource.external_ipv6_prefix
    gateway_address                  = resource.gateway_address
    id                               = resource.id
    internal_ipv6_prefix             = resource.internal_ipv6_prefix
    ip_cidr_range                    = resource.ip_cidr_range
    ip_collection                    = resource.ip_collection
    ipv6_access_type                 = resource.ipv6_access_type
    ipv6_cidr_range                  = resource.ipv6_cidr_range
    ipv6_gce_endpoint                = resource.ipv6_gce_endpoint
    name                             = resource.name
    network                          = resource.network
    private_ip_google_access         = resource.private_ip_google_access
    private_ipv6_google_access       = resource.private_ipv6_google_access
    project                          = resource.project
    purpose                          = resource.purpose
    region                           = resource.region
    reserved_internal_range          = resource.reserved_internal_range
    resolve_subnet_mask              = resource.resolve_subnet_mask
    role                             = resource.role
    self_link                        = resource.self_link
    send_secondary_ip_range_if_empty = resource.send_secondary_ip_range_if_empty
    stack_type                       = resource.stack_type
    state                            = resource.state
    subnetwork_id                    = resource.subnetwork_id
    log_config                       = resource.log_config
    params                           = resource.params
    secondary_ip_range               = resource.secondary_ip_range
    timeouts                         = resource.timeouts
  } }
}
