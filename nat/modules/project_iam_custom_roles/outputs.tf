#Output Project Roles IDs
output "projects_roles_ids" {
  description = "Project Roles Name"
  value = tomap({
    for k, my-custom-project-roles in google_project_iam_custom_role.my-custom-project-roles : k => my-custom-project-roles.id
  })
}