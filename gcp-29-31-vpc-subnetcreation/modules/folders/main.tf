# Creation of folder in GCP under organization/folders
# Input - display_name, prefix and parent ID 
# Output - name, lifecycle_sate and create_time
# Dependency - NA
resource "google_folder" "folder_init" {
  for_each     = var.folder_block
  display_name = each.value.prefix == "" ? "${each.value.name}" : "${each.value.prefix}_${each.value.name}"
  parent       = each.value.parent
}


# Providing GCP roles to the IAM identities at folder level
# Input - folder Id, role, members and condition
# Output - etag
# Dependency - folder ID
resource "google_folder_iam_binding" "folder_iam_authoritative" {
  for_each = {
    for role in local.folder_roles : "${role.index_key}-${role.role_key}" => role
  }
  folder  = google_folder.folder_init[each.value.index_key].name
  role    = each.value.role_id
  members = each.value.members
  dynamic "condition" {
    for_each = each.value.condition_creation == true ? [1] : []
    content {
      title       = each.value.condition.title
      description = each.value.condition.description
      expression  = each.value.condition.expression
    }
  }
}

# Providing GCP org polisies at folder level
# Input - folder Id, constraints, list_policy and inherit_from_parent
# Output - etag and update_time
# Dependency - folder ID
resource "google_folder_organization_policy" "services_policy_deny" {
  for_each = {
    for constraint in local.folder_constraints : "${constraint.index_key}-${constraint.constraint_key}" => constraint
    if constraint.deny == true
  }
  folder     = google_folder.folder_init[each.value.index_key].name
  constraint = each.value.constraint_id
  list_policy {
    inherit_from_parent = each.value.inherit_from_parent
    deny {
      values = each.value.deny_value
    }
  }
}