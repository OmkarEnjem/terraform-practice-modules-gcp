# Output Subnet_block
output "subnet_block_output" {
  description = "Subnet Block"
  value = {
    for subnet_key, subnet-secondary-ip-ranges in google_compute_subnetwork.subnet-secondary-ip-ranges : subnet_key => {
      subnet_key         = subnet_key
      name               = subnet-secondary-ip-ranges.name
      id                 = subnet-secondary-ip-ranges.id
      gateway_address    = subnet-secondary-ip-ranges.gateway_address
      ip_cidr_range      = subnet-secondary-ip-ranges.ip_cidr_range
      network            = subnet-secondary-ip-ranges.network
      project            = subnet-secondary-ip-ranges.project
      region             = subnet-secondary-ip-ranges.region
      log_config         = subnet-secondary-ip-ranges.log_config
      secondary_ip_range = subnet-secondary-ip-ranges.secondary_ip_range
    }
  }
}