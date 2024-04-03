# Creation of natgateway/s in GCP 
# Input - name, prefix, project_id, router, region, udp_idle_timeout_sec,  udp_idle_timeout_sec, icmp_idle_timeout_sec, tcp_established_idle_timeout_sec, tcp_transitory_idle_timeout_sec, enable_endpoint_independent_mapping, min_ports_per_vm, nat_ip_allocate_option mode, source_subnetwork_ip_ranges_to_nat, nat_ips, subnetwork, source_ip_ranges_to_nat
# Output - Name
# Dependency - Project_id, routername, region, nat_ips, nat_ip_allocate_option, list of subnetworks
resource "google_compute_router_nat" "cloud_nat_resource" {
  for_each                            = var.natgateway_block
  name                                = each.value.prefix == "" ? "${each.value.name}" : "${each.value.prefix}-${each.value.name}"
  project                             = each.value.project_id
  router                              = each.value.router
  region                              = each.value.region
  udp_idle_timeout_sec                = each.value.udp_idle_timeout_sec == null ? local.default_values.udp_idle_timeout_sec : each.value.udp_idle_timeout_sec
  icmp_idle_timeout_sec               = each.value.icmp_idle_timeout_sec == null ? local.default_values.icmp_idle_timeout_sec : each.value.icmp_idle_timeout_sec
  tcp_established_idle_timeout_sec    = each.value.tcp_established_idle_timeout_sec == null ? local.default_values.tcp_established_idle_timeout_sec : each.value.tcp_established_idle_timeout_sec
  tcp_transitory_idle_timeout_sec     = each.value.tcp_transitory_idle_timeout_sec == null ? local.default_values.tcp_transitory_idle_timeout_sec : each.value.tcp_transitory_idle_timeout_sec
  enable_endpoint_independent_mapping = each.value.enable_endpoint_independent_mapping == null ? local.default_values.enable_endpoint_independent_mapping : each.value.enable_endpoint_independent_mapping
  min_ports_per_vm                    = each.value.min_ports_per_vm == null ? local.default_values.min_ports_per_vm : each.value.min_ports_per_vm
  nat_ip_allocate_option              = each.value.nat_ip_allocate_option
  nat_ips                             = each.value.nat_ip_allocate_option == "MANUAL_ONLY" ? local.iplist[each.key] : []
  source_subnetwork_ip_ranges_to_nat  = each.value.source_subnetwork_ip_ranges_to_nat
  dynamic "subnetwork" {
    for_each = each.value.source_subnetwork_ip_ranges_to_nat == "LIST_OF_SUBNETWORKS" ? each.value.subnetwork : {}
    content {
      name                     = subnetwork.value["name"]
      source_ip_ranges_to_nat  = subnetwork.value["source_ip_ranges_to_nat"]
      secondary_ip_range_names = subnetwork.value["secondary_ip_range_names"]
    }
  }

  log_config {
    enable = each.value.log_config_enable
    filter = each.value.log_config_filter
  }
  depends_on = [
    google_compute_address.staticip_resource
  ]
}

# Creation of staticip/s in GCP 
# Input - name, prefix, project_id, router, region, natgateway_block, nat_ip_allocate_option
# Output - name
# Dependency - Project_id, region, nat_ip_allocate_option
resource "google_compute_address" "staticip_resource" {
  for_each = {
    for i, map in local.temp : map.natname => map
    if map.nat_ip_allocate_option == "MANUAL_ONLY"
  }
  region  = each.value.region
  project = each.value.project_id
  name    = each.value.natname
}