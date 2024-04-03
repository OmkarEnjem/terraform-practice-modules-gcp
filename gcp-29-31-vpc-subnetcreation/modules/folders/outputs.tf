#Output Folders IDs
output "folders_ids" {
  description = "Folders Name"
  value = tomap({
    for k, folder_init in google_folder.folder_init : k => folder_init.folder_id
  })
}

#Output Folder IAM Roles
output "folder_iam_roles" {
  description = "Folders IAM Roles"
  value = tomap({
    for k, folder_iam_authoritative in google_folder_iam_binding.folder_iam_authoritative : k => folder_iam_authoritative.role
  })
}

#Output Folder IAM Members
output "folder_iam_members" {
  description = "Folders IAM Members"
  value = tomap({
    for k, folder_iam_authoritative in google_folder_iam_binding.folder_iam_authoritative : k => folder_iam_authoritative.members
  })
}

#Output Folder IAM Roles Members
output "roles_binding" {
  value = local.folder_roles
}

#Output Folder Constraints Policy Deny
output "folder_constraints_policy_deny" {
  description = "Folders Constraints_Policy"
  value = tomap({
    for k, services_policy_deny in google_folder_organization_policy.services_policy_deny : k => services_policy_deny.list_policy
  })
}

