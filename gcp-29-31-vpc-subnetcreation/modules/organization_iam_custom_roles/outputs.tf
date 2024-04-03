#Output Organization Roles IDs
output "organization_roles_ids" {
  description = "Organization Roles Name"
  value = tomap({
    for k, my-custom-organization-roles in google_organization_iam_custom_role.my-custom-organization-roles : k => my-custom-organization-roles.id
  })
}