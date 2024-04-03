# Creation of subnet under vpc
# Input - name, ip_cidr_range, region, private_ip_google_access, purpose, role, network, range_name and secondary_ip_cidr_range 
# Output - id, creation_timestamp, gateway_address and self_link
# Dependency - network_id
resource "google_compute_subnetwork" "subnet-secondary-ip-ranges" {
  for_each = {
    for k in local.subnet : "${k.subnet_key}-${k.zone_key}" => k
  }
  name                     = each.value.prefix == "" ? "${each.value.name}" : "${each.value.prefix}-${each.value.name}"
  ip_cidr_range            = each.value.ip_cidr_range
  project                  = each.value.project_id
  region                   = each.value.region
  private_ip_google_access = each.value.private_ip_google_access
  purpose                  = each.value.purpose_of_subnet
  role                     = each.value.purpose_of_subnet == "INTERNAL_HTTPS_LOAD_BALANCER" ? each.value.role_of_subnet : null
  network                  = var.vpc_id[each.value.vpc_network]
  dynamic "log_config" {
    for_each = each.value.purpose_of_subnet == "PRIVATE" ? [1] : []
    content {
      aggregation_interval = each.value.log_aggregation_interval == null ? local.default_values.log_aggregation_interval : each.value.log_aggregation_interval
      flow_sampling        = each.value.log_flow_sampling == null ? local.default_values.log_flow_sampling : each.value.log_flow_sampling
      metadata             = each.value.log_metadata == null ? local.default_values.log_metadata : each.value.log_metadata
      metadata_fields      = each.value.log_metadata == "CUSTOM_METADATA" ? each.value.log_metadata_fields == null ? local.default_values.log_custom_metadata_fields : each.value.log_metadata_fields : null
    }
  }
  /*secondary_ip_range = each.value.purpose_of_subnet == "PRIVATE" ? each.value.secondary != null ? [for k, v in each.value.secondary : {
    range_name    = v.range_name
    ip_cidr_range = v.secondary_ip_cidr_range
  }] : local.default_values.secondary : null*/
}