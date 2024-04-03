# Creation of custom organiation roles in GCP
# Input - role_id, org_id, title, prefix, permissions, stage and description
# Output - deleted, id, and name
# Dependency - NA
resource "google_organization_iam_custom_role" "my-custom-organization-roles" {
  for_each    = var.iam_organization_custom_roles_block
  role_id     = each.value.role_id
  org_id      = each.value.org_id
  title       = each.value.prefix == "" ? "${each.value.title}" : "${each.value.prefix}_${each.value.title}"
  description = each.value.description
  permissions = each.value.permissions
  stage       = each.value.stage
}