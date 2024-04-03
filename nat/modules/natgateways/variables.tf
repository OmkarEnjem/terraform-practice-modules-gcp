#Natgateway structure
variable "natgateway_block" {
  type = map(object({
    name                                = string
    prefix                              = string
    project_id                          = string
    nat_ip_allocate_option              = string
    source_subnetwork_ip_ranges_to_nat  = string
    region                              = string
    router                              = string
    udp_idle_timeout_sec                = number
    icmp_idle_timeout_sec               = number
    tcp_established_idle_timeout_sec    = number
    tcp_transitory_idle_timeout_sec     = number
    enable_endpoint_independent_mapping = bool
    reserve_number_of_staticips         = number
    min_ports_per_vm                    = number
    log_config_enable                   = bool
    log_config_filter                   = string
    subnetwork = map(object({
      name                     = string
      source_ip_ranges_to_nat  = list(string)
      secondary_ip_range_names = list(string)
    }))
  }))
}

