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