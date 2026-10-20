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
