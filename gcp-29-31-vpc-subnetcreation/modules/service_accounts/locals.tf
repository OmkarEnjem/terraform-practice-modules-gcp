# Creation of locals module to parse the service account tfvars roles data.
locals {
  service_account_roles = flatten([
    for index_key, info in var.service_accounts_block : [
      for role_key, role_data in info.roles : {
        role_key           = role_key
        index_key          = index_key
        role               = role_data.role
        members            = role_data.members
        condition          = role_data.condition
        condition_creation = role_data.condition_creation
      }
    ]
  ])
}