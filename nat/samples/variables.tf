/*#Folder structure
variable "folder_block" {
  description = "This hold folders information "
  type = map(object({
    name   = string
    parent = string
    prefix = string
    roles = map(object({
      role_id            = string
      members            = list(string)
      condition_creation = bool
      condition = object({
        title       = string
        description = string
        expression  = string
      })
      })
    )
    constraints = map(object({
      constraint_id       = string
      inherit_from_parent = bool
      deny                = bool
      deny_value          = list(string)
      })
    )
    })
  )
}

#Service Account Strutcure
variable "service_accounts_block" {
  description = "This contains service account information"
  type = map(object({
    sa_name              = string
    prefix               = string
    project_id           = string
    account_id           = string
    key_creation         = bool
    key_rotation         = bool
    sa_key_rotation_days = number
    public_key_type      = string
    private_key_type     = string
    key_algorithm        = string
    description          = string
    roles = map(object({
      role               = string
      members            = list(string)
      condition_creation = bool
      condition = object({
        title       = string
        description = string
        expression  = string
      })
      })
    )
    })
  )
}

#IAM Organization Roles Structure
variable "iam_organization_custom_roles_block" {
  type = map(object({
    role_id     = string
    org_id      = number
    title       = string
    prefix      = string
    description = string
    permissions = list(string)
    stage       = string
    })
  )
  description = "This contains organization custom roles information"
  validation {
    condition = alltrue([
      for element in var.iam_organization_custom_roles_block : can(regex("^[A-Za-z]+$", element.role_id)) == true && length(element.role_id) < 30
    ])
    error_message = "The role role_id value only a-z, and A-Z are allowed and less then 30 char."
  }
  validation {
    condition = alltrue([
      for element in var.iam_organization_custom_roles_block : can(regex("^[0-9]+$", element.org_id)) == true
    ])
    error_message = "The role org_id value only 0-9 are allowed and less then 30 char."
  }
  validation {
    condition = alltrue([
      for element in var.iam_organization_custom_roles_block : length(element.title) > 10
    ])
    error_message = "The role title value should be greater then 10 char."
  }
  validation {
    condition = alltrue([
      for element in var.iam_organization_custom_roles_block : length(element.permissions) >= 1
    ])
    error_message = "The role permissions value should be greater then 1."
  }
}

#IAM Project Roles Structure
variable "iam_project_custom_roles_block" {
  type = map(object({
    role_id     = string
    title       = string
    prefix      = string
    description = string
    permissions = list(string)
    project     = string
    stage       = string
    })
  )
  description = "This contains projects custom roles information"
  validation {
    condition = alltrue([
      for element in var.iam_project_custom_roles_block : can(regex("^[A-Za-z]+$", element.role_id)) == true && length(element.role_id) < 30
    ])
    error_message = "The role role_id value only a-z, and A-Z are allowed and less then 30 char."
  }
  validation {
    condition = alltrue([
      for element in var.iam_project_custom_roles_block : length(element.title) > 10
    ])
    error_message = "The role title value should be greater then 10 char."
  }
  validation {
    condition = alltrue([
      for element in var.iam_project_custom_roles_block : length(element.permissions) >= 1
    ])
    error_message = "The role permissions value should be greater then 1."
  }
}*/

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
}

/*
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
    udp_idle_timeout_sec                = optional(number)
    icmp_idle_timeout_sec               = optional(number)
    tcp_established_idle_timeout_sec    = optional(number)
    tcp_transitory_idle_timeout_sec     = optional(number)
    enable_endpoint_independent_mapping = optional(bool)
    reserve_number_of_staticips         = number
    min_ports_per_vm                    = optional(number)
    log_config_enable                   = bool
    log_config_filter                   = string
    subnetwork = optional(map(object({
      name                     = string
      source_ip_ranges_to_nat  = list(string)
      secondary_ip_range_names = list(string)
    })))
  }))
}
*/