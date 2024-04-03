# Creation of locals module to parse the Vpc default values.
locals {
  default_values = {
    routing_mode                    = "REGIONAL"
    mtu                             = 1460
    delete_default_routes_on_create = false
  }
}