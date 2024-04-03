# This block will create NatGateways

## resource "google_compute_router_nat" "cloud_nat_resource"

| varible               | Mandatory   | Type   |       Description  |
|-----------------------|-------------|--------|--------------------|
| natgateway_block      | Yes         | map    | Its a parent object                                                                                                                   |
| name                  | Yes         | string | Describe the name of the natgateway                                                                                                     |
| project_id            | No          | string | Under which organisation or project we have to create it
| subnetwork            | yes         | string | which subnetwork we have to create it
| router                | yes         | string | The name of the Cloud Router in which this NAT will be configured.
| nat_ip_allocate_option| yes         | string | Two allowed values with AUTO_ONLY or MANUAL_ONLY       nat_ip_allocate_option
| udp_idle_timeout_sec  | No          | number | Timeout (in seconds) for UDP connections. Defaults to 30s if not set.
| icmp_idle_timeout_sec | No          | number | Timeout (in seconds) for ICMP connections. Defaults to 30s if not set.
|tcp_established_idle_timeout_sec| No | number | Timeout (in seconds) for TCP established connections. Defaults to 1200s if not set.
|tcp_transitory_idle_timeout_sec| No  | number | Timeout (in seconds) for TCP transitory connections. Defaults to 30s if not set.
|enable_endpoint_independent_mapping| No|bool  | Specifies if endpoint independent mapping is enabled.
| min_ports_per_vm      | No          | number | Minimum number of ports allocated to a VM from this NAT.
| log_config_enabl      | No          | bool   | Indicates whether or not to export logs
| log_config_filter     | No          | string | Specifies the desired filtering of logs on this NAT. Possible values are ERRORS_ONLY, TRANSLATIONS_ONLY, and ALL
| nat_ips               | No          |list(string)|Self-links of NAT IPs. Only valid if natIpAllocateOption is set to MANUAL_ONLY.
| nat_ip_allocate_option| yes         | string | Valid values are AUTO_ONLY for only allowing NAT IPs allocated by Google Cloud Platform, or MANUAL_ONLY for only user-allocated NAT IP addresses
| source_subnetwork_ip_ranges_to_nat|yes|string| How NAT should be configured per Subnetwork. Possible values are ALL_SUBNETWORKS_ALL_IP_RANGES, ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES, and LIST_OF_SUBNETWORKS
| subnetwork-name       | yes         | string | (Required) Self-link of subnetwork to NAT
| subnetwork/source_ip_ranges_to_nat|yes|list(string)| List of options for which source IPs in the subnetwork should have NAT enabled.
| prefix                | No          | string | It is the prefix attached to project name                                                                                            |
| region                | No          | string | In which region we have to create it

Import

RouterNat & Staticips can be imported using any of these accepted formats:
NATs:
$terraform import module.terraform-gcp-natgateways.google_compute_router_nat.cloud_nat_resource projects/{{project}}/regions/{{region}}/routers/{{router}}/{{name}}
$terraform import module.terraform-gcp-natgateways.google_compute_router_nat.cloud_nat_resource {{project}}/{{region}}/{{router}}/{{name}}
$terraform import module.terraform-gcp-natgateways.google_compute_router_nat.cloud_nat_resource {{region}}/{{router}}/{{name}}
$terraform import module.terraform-gcp-natgateways.google_compute_router_nat.cloud_nat_resource {{router}}/{{name}}

Staticips:

$terraform import module.terraform-gcp-natgateways.google_compute_address.staticip_resource projects/{{project}}/regions/{{region}}/addresses/{{name}}
$terraform import module.terraform-gcp-natgateways.google_compute_address.staticip_resource {{project}}/{{region}}/{{name}}
$terraform import module.terraform-gcp-natgateways.google_compute_address.staticip_resource {{region}}/{{name}}
$terraform import module.terraform-gcp-natgateways.google_compute_address.staticip_resource {{name}}
