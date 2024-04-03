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
  validation {
    condition = alltrue([
      for element in var.service_accounts_block : can(regex("[a-z]([-a-z0-9]*[a-z0-9])", element.account_id)) == true && length(element.account_id) < 30
    ])
    error_message = "The service account_id value only a-z, A-Z and 0-9 are allowed and less then 30 char."
  }
}