locals {
  folder_roles = flatten([
    for index_key, info in var.folder_block : [
      for role_key, role_data in info.roles : {
        role_key           = role_key
        index_key          = index_key
        role_id            = role_data.role_id
        members            = role_data.members
        condition          = role_data.condition
        condition_creation = role_data.condition_creation
      }
    ]
  ])
  folder_constraints = flatten([
    for index_key, info in var.folder_block : [
      for constraint_key, constraint_data in info.constraints : {
        constraint_key      = constraint_key
        index_key           = index_key
        constraint_id       = constraint_data.constraint_id
        inherit_from_parent = constraint_data.inherit_from_parent
        deny                = constraint_data.deny
        deny_value          = constraint_data.deny_value
      }
    ]
  ])
}