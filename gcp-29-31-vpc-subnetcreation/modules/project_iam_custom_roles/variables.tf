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
}