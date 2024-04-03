# Subnet structure
variable "vpc_block" {
  type = map(object({
    subnet_block = map(object({
      name                       = string
      prefix                     = string
      ip_cidr_range              = string
      vpc_network                = string
      project_id                 = string
      region                     = string
      private_ip_google_access   = bool
      purpose_of_subnet          = string
      role_of_subnet             = string
      log_aggregation_interval   = string
      log_flow_sampling          = number
      log_metadata               = string
      log_custom_metadata_fields = list(string)
      /*secondary = map(object({
        range_name              = string
        secondary_ip_cidr_range = string
      }))*/
    }))
  }))
  /*
  validation {
    condition = alltrue(flatten([
      for k, v in var.vpc_block : [
        for element in v.subnet_block :
        can(regex("^[0-9A-Za-z-]+$", element.project_id)) == true && length(element.project_id) >= 6
      ]
      if v.subnet_block != null
    ]))
    error_message = "The project_id value only a-z, A-Z and 0-9 are allowed and greater then or equal to 6 char."
  }
  validation {
    condition = alltrue(flatten([
      for k, v in var.vpc_block : [
        for element in v.subnet_block :
        can(regex("^[0-9a-z-]+$", element.region)) == true && length(element.region) > 1
      ]
      if v.subnet_block != null
    ]))
    error_message = "The region value should not to be empty the example value can be like this eg: asia-south1."
  }
  validation {
    condition = alltrue(flatten([
      for k, v in var.vpc_block : [
        for element in v.subnet_block :
        can(regex("PRIVATE|INTERNAL_HTTPS_LOAD_BALANCER", element.purpose_of_subnet))
      ]
      if v.subnet_block != null
    ]))
    error_message = "The purpose_of_subnet value should be PRIVATE or INTERNAL_HTTPS_LOAD_BALANCER not to be empty and other values not allowed."
  }
  validation {
    condition = alltrue(flatten([
      for k, v in var.vpc_block : [
        for element in v.subnet_block :
        element.purpose_of_subnet == "INTERNAL_HTTPS_LOAD_BALANCER" ? element.private_ip_google_access == false : element.private_ip_google_access == true
      ]
      if v.subnet_block != null
    ]))
    error_message = "The purpose_of_subnet value is INTERNAL_HTTPS_LOAD_BALANCER then the private_ip_google_access should be false."
  }
  validation {
    condition = alltrue(flatten([
      for k, v in var.vpc_block : [
        for element in v.subnet_block :
        element.purpose_of_subnet == "INTERNAL_HTTPS_LOAD_BALANCER" ? element.secondary == null : element.purpose_of_subnet == "PRIVATE" ? element.secondary != null || element.secondary == null : element.secondary != null
      ]
      if v.subnet_block != null
    ]))
    error_message = "The purpose_of_subnet value is INTERNAL_HTTPS_LOAD_BALANCER then the secondary block should not applied remove the secondary block."
  }
  validation {
    condition = alltrue(flatten([
      for k, v in var.vpc_block : [
        for element in v.subnet_block :
        element.purpose_of_subnet == "INTERNAL_HTTPS_LOAD_BALANCER" ? can(regex("ACTIVE|BACKUP", element.role_of_subnet)) : length(element.role_of_subnet) == 0
      ]
      if v.subnet_block != null
    ]))
    error_message = "The purpose_of_subnet value is INTERNAL_HTTPS_LOAD_BALANCER then the role_of_subnet should be ACTIVE or BACKUP, OR the purpose_of_subnet value is PRIVATE then the role_of_subnet should be empty string remove white space within double quotes."
  }*/
}

# Vpc id structure
variable "vpc_id" {
  type = map(string)
}