
output "block_nat" {
  description = ""
  value = {
    for k, v in google_compute_router_nat.cloud_nat_resource : k => {
      id                                 = v.id
      name                               = v.name
      nat_ip_allocate_option             = v.nat_ip_allocate_option
      nat_ips                            = v.nat_ips
      subnetwork                         = v.subnetwork
      log_config                         = v.log_config
      min_ports_per_vm                   = v.min_ports_per_vm
      source_subnetwork_ip_ranges_to_nat = v.source_subnetwork_ip_ranges_to_nat

    }
  }
}
output "block_ips" {
  description = "natgateway names"
  value = {
    for k, v in google_compute_address.staticip_resource : k => {
      name    = v.name
      project = v.project
      address = v.address
    }
  }
}