# This block will creates subnets in vpc

## resource "google_compute_subnetwork" "subnet-secondary-ip-ranges"

| varible               | Mandatory   | Type   | Description |
|-----------------------|-------------|--------|-------------|
| subnet_block          | Yes         | map    | Its a parent object subnet block                                                                                                   |
| name                  | yes         | string | Defining the subnet name  "Dont USE UNDERSCOR "_"                                                                                    |
| prefix                | No          | string | It is the prefix attached to vpc name                                                                                                |
| ip_cidr_range         | Yes         | string | Provide primary ip cidr range                                                                                                        |
| vpc_network           | Yes         | string | Provide vpc network id but here provide Vpc_subnet_block index_key as vpc id ie:"vpc_subnet1"                                        |
| project_id            | yes         | string | Provide the vpc project id                                                                                                           |
| region                | Yes         | string | provide the region                                                                                                                   |
| private_ip_google_access| yes       | bool   | Providing the google access to subnet                                                                                                |
| purpose_of_subnet     | yes         | string | Value should be PRIVATE or INTERNAL_HTTPS_LOAD_BALANCER                                                                              |
| role_of_subnet        | yes         | map    | It used to accept constraint id                                                                                                      |
| log_aggregation_interval| No        | string | Can only be specified if VPC flow logging for this subnetwork is enabled. Toggles the aggregation interval for collecting flow logs. Increasing the interval time will reduce the amount of generated flow logs for long lasting connections.     default is an interval of 5 seconds per connection. Default value is INTERVAL_5_SEC. Possible values are INTERVAL_5_SEC, INTERVAL_30_SEC, INTERVAL_1_MIN, INTERVAL_5_MIN, INTERVAL_10_MIN, and INTERVAL_15_MIN. |                                              |
| log_flow_sampling     | No          | number | Can only be specified if VPC flow logging for this subnetwork is enabled. The value of the field must be in [0, 1]. Set the sampling rate of VPC flow logs within the subnetwork where 1.0 means all collected logs are reported and 0.0 means no logs are reported. Default is 0.5 which means half of all collected logs are reported |
| log_metadata          | No          | string | Can only be specified if VPC flow logging for this subnetwork is enabled. Configures whether metadata fields should be added to the reported VPC flow logs. Default value is INCLUDE_ALL_METADATA. Possible values are EXCLUDE_ALL_METADATA, INCLUDE_ALL_METADATA, and CUSTOM_METADATA         |
| log_custom_metadata_fields | No     | list(string) | List of metadata fields that should be added to reported logs. Can only be specified if VPC flow logs for this subnetwork is enabled and "metadata" is set to CUSTOM_METADATA.                |
| secondary             | yes         | map    | It is map for secondary ip                                                                                                           |
| range_name            | yes         | string | Provide the name for secondary range  "Dont USE UNDERSCOR "_" |
| secondary_ip_cidr_range|Yes         | string | Provide secondary ip cidr range |

Import:
Subnetwork can be imported using any of these accepted formats:

$ terraform import module.terraform-gcp-subnet.google_compute_subnetwork.subnet-secondary-ip-ranges projects/{{project}}/regions/{{region}}/subnetworks/{{name}}
$ terraform import module.terraform-gcp-subnet.google_compute_subnetwork.subnet-secondary-ip-ranges {{project}}/{{region}}/{{name}}
$ terraform import module.terraform-gcp-subnet.google_compute_subnetwork.subnet-secondary-ip-ranges {{region}}/{{name}}
$ terraform import module.terraform-gcp-subnet.google_compute_subnetwork.subnet-secondary-ip-ranges {{name}}