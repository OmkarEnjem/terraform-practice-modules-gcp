#Router structure
variable "router_block" {
  type = map(object({
    name              = string
    prefix            = string
    project_id        = string
    network           = string
    region            = string
    description       = string
    asn               = number
    advertise_mode    = string
    advertised_groups = list(string)
    advertised_ip_ranges = map(object({
    range = string }))
  }))

  validation {
    condition = alltrue([
      for element in var.router_block : can(regex("^[0-9A-Za-z-_]+$", element.name)) == true && length(element.name) >= 6
    ])
    error_message = "The router name value only a-z, A-Z and 0-9 are allowed and greater then or equal to 6 char."
  }
  validation {
    condition = alltrue([
      for element in var.router_block : can(regex("^[0-9a-z-]+$", element.project_id)) == true && length(element.project_id) >= 6 && length(element.project_id) <= 30
    ])
    error_message = "The project_id name value only a-z and 0-9 are allowed and greater then or equal to 6 char and not greater then 30 char."
  }
  validation {
    condition = alltrue([
      for element in var.router_block : can(regex("^[0-9A-Za-z-_]+$", element.network)) == true && length(element.network) >= 6
    ])
    error_message = "The network name value only a-z and 0-9 are allowed and greater then or equal to 6 char and not greater then 30 char."
  }
}