# Creation of locals module to parse the Subnets and Subnets outputs.
locals {
  subnet = flatten([
    for subnet_key, subnet_data in var.vpc_block : [
      for zone_key, zone_data in subnet_data.subnet_block : {
        zone_key                 = zone_key
        subnet_key               = subnet_key
        name                     = zone_data.name
        prefix                   = zone_data.prefix
        ip_cidr_range            = zone_data.ip_cidr_range
        vpc_network              = zone_data.vpc_network
        project_id               = zone_data.project_id
        region                   = zone_data.region
        private_ip_google_access = zone_data.private_ip_google_access
        purpose_of_subnet        = zone_data.purpose_of_subnet
        role_of_subnet           = zone_data.role_of_subnet
        log_aggregation_interval = zone_data.log_aggregation_interval
        log_flow_sampling        = zone_data.log_flow_sampling
        log_metadata             = zone_data.log_metadata
        log_metadata_fields      = zone_data.log_custom_metadata_fields
        //secondary                = zone_data.secondary
      }
    ]
    if subnet_data.subnet_block != null
  ])
  default_values = {
    log_aggregation_interval   = "INTERVAL_5_SEC"
    log_flow_sampling          = 0.5
    log_metadata               = "INCLUDE_ALL_METADATA"
    log_custom_metadata_fields = [""]
    //secondary                  = null
  }
}