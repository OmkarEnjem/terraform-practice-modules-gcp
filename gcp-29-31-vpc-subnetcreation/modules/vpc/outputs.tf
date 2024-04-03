# Output VPC Block Output
output "vpc_block_output" {
  description = "Vpc Block Output"
  value = {
    for vpc_key, vpc_network in google_compute_network.vpc_network : vpc_key => {
      vpc_key      = vpc_key
      name         = vpc_network.name
      id           = vpc_network.id
      gateway_ipv4 = vpc_network.gateway_ipv4
      routing_mode = vpc_network.routing_mode
      project      = vpc_network.project
    }
  }
}

# Output VPC IDs
output "vpc_id" {
  description = "Vpc Id"
  value = {
    for k, vpc_network in google_compute_network.vpc_network : k => vpc_network.id
  }
}
