#Folder structure block
variable "folder_block" {
  description = "This hold folders information"
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
  validation {
    condition = alltrue([
      for element in var.folder_block : can(regex("^[0-9A-Za-z-_]+$", element.name)) == true && length(element.name) < 30
    ])
    error_message = "The folder name value only a-z, A-Z and 0-9 are allowed and less then 30 char."
  }
}