# This block will creates in vpc's in projects

## resource "google_compute_network" "vpc_network"

| varible               | Mandatory   | Type   | Description |
|-----------------------|-------------|--------|-------------|
| vpc_block             | Yes         | map    | Its a parent object The name in the format of network-01 not exceeds 10 chars                                                                                                              |
| name                  | Yes         | string | Describe the name of the Vpc                                                                                                         |
| auto_create_subnetworks| yes        | bool   | To restrict the auto_create_subnetworks                                                                                              |
| prefix                | No          | string | It is the prefix attached to vpc name                                                                                                |
| routing_mode          | yes         | string | To Create vpc in global or regional the value must be "GLOBAL" or "REGIONAL"                                                         |                                       |
| project_id            | Yes         | string | To create vpc in the respective project_id                                                                                           |
| mtu                   | Yes         | number | The value should be in range 1460-1500                                                                                               |                       |
| delete_default        |             |        |                                                                                                                                      |
|  _routes_on_create    | yes         | bool   | To avoid default route                                                                                                               |

Import:
Network can be imported using any of these accepted formats:

$ terraform import module.terraform-gcp-vpc.google_compute_network.vpc_network projects/{{project}}/global/networks/{{name}}
$ terraform import module.terraform-gcp-vpc.google_compute_network.vpc_network {{project}}/{{name}}
$ terraform import module.terraform-gcp-vpc.google_compute_network.vpc_network {{name}}
