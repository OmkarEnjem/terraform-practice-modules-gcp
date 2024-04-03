# Vpc structure
variable "vpc_block" {
  description = "This hold Vpc information"
  type = map(object({
    name                            = string
    prefix                          = string
    auto_create_subnetworks         = bool
    routing_mode                    = string
    project_id                      = string
    mtu                             = number
    delete_default_routes_on_create = bool
  }))
  validation {
    condition = alltrue([
      for element in var.vpc_block : can(regex("^[0-9A-Za-z-]+$", element.name)) == true && length(element.name) > 1
    ])
    error_message = "The vpc, subnet and secondary_range name value not to be empty and underscores not allowed."
  }
  validation {
    condition = alltrue([
      for element in var.vpc_block : can(regex("^[0-9A-Za-z-]+$", element.project_id)) == true && length(element.project_id) >= 6
    ])
    error_message = "The project_id value only a-z, A-Z and 0-9 are allowed and greater then or equal to 6 char."
  }
}