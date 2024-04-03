locals {
  temp = flatten([
    for k, v in var.natgateway_block : [
      for i in range(v.reserve_number_of_staticips) : {
        region                 = v.region
        project_id             = v.project_id
        natname                = join("-staticip-", [k, i])
        nat_ip_allocate_option = v.nat_ip_allocate_option
      }
    ]
  ])
  staticip_list = {

    for k, static in google_compute_address.staticip_resource : k => static.id
  }
  iplist = { for k, i in local.staticip_list : substr(k, 0, 9) => i... }

  default_values = {
    udp_idle_timeout_sec                = 30
    icmp_idle_timeout_sec               = 30
    tcp_established_idle_timeout_sec    = 1200
    tcp_transitory_idle_timeout_sec     = 30
    enable_endpoint_independent_mapping = true
    min_ports_per_vm                    = 64
  }
}
