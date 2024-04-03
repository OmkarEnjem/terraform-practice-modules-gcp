# Creation of Vpc in Project
# Input - project, name, auto_create_subnetworks, routing_mode, mtu and delete_default_routes_on_create. 
# Output - id, gateway_ipv4 and self_link
# Dependency - project_id
resource "google_compute_network" "vpc_network" {
  for_each                        = var.vpc_block
  project                         = each.value.project_id
  name                            = each.value.prefix == "" ? "${each.value.name}" : "${each.value.prefix}-${each.value.name}"
  auto_create_subnetworks         = each.value.auto_create_subnetworks
  routing_mode                    = each.value.routing_mode == null ? local.default_values.routing_mode : each.value.routing_mode
  mtu                             = each.value.mtu == null ? local.default_values.mtu : each.value.mtu
  delete_default_routes_on_create = each.value.delete_default_routes_on_create == null ? local.default_values.delete_default_routes_on_create : each.value.delete_default_routes_on_create
}