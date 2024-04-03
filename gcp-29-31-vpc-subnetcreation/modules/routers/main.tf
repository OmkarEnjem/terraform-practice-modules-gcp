# Creation of router/s in GCP under project/s
# Input - name, network, project_id, bgp and advertised_ip_ranges(range)
# Output - id, Name
# Dependency - Project_id, Network_name

resource "google_compute_router" "cloud_router_map" {
  for_each = var.router_block
  name     = each.value.prefix == "" ? "${each.value.name}" : "${each.value.prefix}-${each.value.name}"
  project  = each.value.project_id
  region   = each.value.region
  network  = each.value.network

  bgp {
    asn               = each.value.asn
    advertise_mode    = each.value.advertise_mode
    advertised_groups = each.value.advertised_groups
    dynamic "advertised_ip_ranges" {
      for_each = each.value.advertised_ip_ranges
      content {
        range = advertised_ip_ranges.value["range"]
      }
    }
  }
}