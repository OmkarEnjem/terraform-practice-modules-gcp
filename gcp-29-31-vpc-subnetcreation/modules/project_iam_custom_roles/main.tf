# Creation of custom project roles in GCP under projects
# Input - role_id, title, prefix, permissions, project, stage and description
# Output - deleted, id, and name
# Dependency - NA
resource "google_project_iam_custom_role" "my-custom-project-roles" {
  for_each    = var.iam_project_custom_roles_block
  role_id     = each.value.role_id
  title       = each.value.prefix == "" ? "${each.value.title}" : "${each.value.prefix}_${each.value.title}"
  description = each.value.description
  permissions = each.value.permissions
  project     = each.value.project
  stage       = each.value.stage
}