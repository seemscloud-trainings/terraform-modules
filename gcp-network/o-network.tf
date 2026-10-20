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
