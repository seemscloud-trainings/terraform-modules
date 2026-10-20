mock_provider "google" {
  mock_resource "google_compute_network" {
    defaults = { self_link = "https://www.googleapis.com/compute/v1/projects/training-project/global/networks/training" }
  }
}
variables {
  project_id = "training-project"
  network    = { name = "training" }
}
run "network_only" {
  command = plan
  assert {
    condition     = length(google_compute_subnetwork.main) == 0 && google_compute_network.main.auto_create_subnetworks == false
    error_message = "Default custom mode must create no implicit subnets."
  }
}
run "global_network_and_regional_subnets" {
  command = apply
  variables {
    network = {
      name         = "training"
      project      = "training-project"
      mtu          = 1500
      routing_mode = "GLOBAL"
      params       = { resource_manager_tags = { "tagKeys/123" = "tagValues/456" } }
      timeouts     = { create = "20m", update = "20m", delete = "20m" }
    }
    subnetworks = {
      west = {
        name                     = "west"
        region                   = "europe-west1"
        ip_cidr_range            = "10.0.1.0/24"
        private_ip_google_access = true
        secondary_ip_range = [
          { range_name = "pods", ip_cidr_range = "10.1.0.0/16" },
          { range_name = "services", ip_cidr_range = "10.2.0.0/20" }
        ]
        log_config = {
          aggregation_interval = "INTERVAL_10_MIN"
          flow_sampling        = 0.25
          metadata             = "CUSTOM_METADATA"
          metadata_fields      = ["src_instance"]
          filter_expr          = "true"
        }
        params   = { resource_manager_tags = { "tagKeys/123" = "tagValues/456" } }
        timeouts = { create = "20m", update = "20m", delete = "20m" }
      }
      central = {
        name          = "central"
        region        = "us-central1"
        ip_cidr_range = "10.0.2.0/24"
      }
    }
  }
  assert {
    condition     = alltrue([for s in google_compute_subnetwork.main : s.network == google_compute_network.main.self_link && s.project == "training-project"])
    error_message = "Subnets must inherit the created global network and its project."
  }
  assert {
    condition     = google_compute_subnetwork.main["west"].region == "europe-west1" && google_compute_subnetwork.main["central"].region == "us-central1"
    error_message = "A global network must support distinct subnet regions."
  }
  assert {
    condition     = length(google_compute_subnetwork.main["west"].secondary_ip_range) == 2 && google_compute_subnetwork.main["west"].log_config[0].flow_sampling == 0.25
    error_message = "Repeated secondary ranges and nested log settings must reach the resource."
  }
}
