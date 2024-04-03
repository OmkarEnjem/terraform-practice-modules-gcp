# #Output Folders IDs
# output "folders_ids" {
#   description = "Folders Name"
#   value       = module.terraform-gcp-folders.folders_ids
# }

# #Output Folder IAM Roles
# output "folder_iam_roles" {
#   description = "Folders IAM Roles"
#   value       = module.terraform-gcp-folders.folder_iam_roles
# }

# #Output Folder IAM Members
# output "folder_iam_members" {
#   description = "Folders IAM Members"
#   value       = module.terraform-gcp-folders.folder_iam_members
# }

# #Output Folder IAM Roles Members
# output "roles_binding" {
#   value = module.terraform-gcp-folders.roles_binding
# }

# #Output Folder Constraints Policy deny
# output "folder_constraints_policy_deny" {
#   description = "Folders Constraints"
#   value       = module.terraform-gcp-folders.folder_constraints_policy_deny
# }

# #Output Service Account Name
# output "service_account_ids" {
#   description = "Service Account Name"
#   value       = module.terraform-gcp-sa.service_account_ids
# }

# #Output Service Account IAM Binding
# output "service_account_iam_binding" {
#   description = "Service Account IAM Roles"
#   value       = module.terraform-gcp-sa.service_account_iam_binding
# }

# #Output Service Account IAM Members
# output "service_account_iam_members" {
#   description = "Service Account IAM Members"
#   value       = module.terraform-gcp-sa.service_account_iam_members
# }

# #Output Service Account Key Rotation Time
# output "rotation_days" {
#   description = "Service Account Key Rotation Time"
#   value       = module.terraform-gcp-sa.rotation_days
# }

# #Output Service Account Public Key
# output "service_account_public_key" {
#   description = "Service Account Public Key"
#   value       = module.terraform-gcp-sa.service_account_public_key
# }

# #Output Service Account Private Key
# output "service_account_private_key" {
#   description = "Service Account private Key"
#   value       = module.terraform-gcp-sa.service_account_private_key
#   sensitive   = true
# }

# #Output Organization Roles IDs
# output "organization_roles_ids" {
#   description = "Organization Roles Name"
#   value       = module.terraform-gcp-organization-iam-custom-roles.organization_roles_ids
# }

# #Output Project Roles IDs
# output "projects_roles_ids" {
#   description = "Project Roles Name"
#   value       = module.terraform-gcp-project-iam-custom-roles.projects_roles_ids
# }

# #Output Router IDs
# output "router_ids" {
#   description = "Router id"
#   value       = module.terraform-gcp-routers.router_ids
# }
# #Output Router Name
 output "router_name" {
   description = "Router Name"
   value       = module.terraform-gcp-routers.router_name
 }


# Output Vpc_Subnet_block
output "vpc_subnet_block_output" {
  description = "vpc Subnet Block output"
  value = {
    for k3, v3 in { for k2, v2 in merge({ for k, v in local.subnet_block : k => v }, local.vpc_block) :
    substr(k2, 0, 10) => v2... } :
    k3 => { for ix3, v33 in v3 : v33.name => v33 }
  }
}

# Output Vpc Ids
output "vpc_id" {
  description = "Vpc Id"
  value       = module.terraform-gcp-vpc.vpc_id
}
