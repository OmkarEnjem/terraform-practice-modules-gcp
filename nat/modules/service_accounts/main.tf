# This module is helps us to create the google servie acccount with iam binding
# Creation of service accounts under project
# Input - account_id, display_name, project and description
# Output - id, email, name and unique_id
# Dependency -  N/A
resource "google_service_account" "service_account" {
  for_each     = var.service_accounts_block
  account_id   = each.value.account_id
  display_name = each.value.prefix == "" ? each.value.sa_name : "${each.value.prefix}_${each.value.sa_name}"
  project      = each.value.project_id
  description  = each.value.description
}

# resource -- admin-account-iam helps us to bind iam role with service account
# Input - service_account_id, members, role and condition
# Output - etag
# Dependency -  resource google_service_account
resource "google_service_account_iam_binding" "admin_account_iam" {
  depends_on = [
    google_service_account.service_account,
  ]
  for_each = {
    for role in local.service_account_roles : "${role.index_key}-${role.role_key}" => role
  }
  service_account_id = google_service_account.service_account[each.value.index_key].id
  members            = each.value.members
  role               = each.value.role
  dynamic "condition" {
    for_each = each.value.condition_creation == true ? [1] : []
    content {
      title       = each.value.condition.title
      description = each.value.condition.description
      expression  = each.value.condition.expression
    }
  }
}

# resource -- helps to rotate service key periodically
# Input - rotation_days
# Output - second, minute, hour, day, month, year, unix and id
# Dependency -  N/A
resource "time_rotating" "sa_key_rotation" {
  for_each = {
    for name, user in var.service_accounts_block : name => user
    if user.key_rotation == true
  }
  rotation_days = each.value.sa_key_rotation_days
}

# resource -- helps to rotate service key periodically [This is the default rotation_days in case of no specification days]
# Input - rotation_days
# Output - second, minute, hour, day, month, year, unix and id
# Dependency -  N/A
resource "time_rotating" "default_key_rotation" {
  rotation_days = 365
}

# resource -- helps to create service key periodically
# Input - service_account_id, public_key_type, private_key_type, key_algorithm and keepers
# Output - id, name, public_key, private_key, valid_after and valid_before
# Dependency -  resource google_service_account and time_rotating
resource "google_service_account_key" "service_account_key" {
  for_each = {
    for name, user in var.service_accounts_block : name => user
    if user.key_creation == true
  }
  service_account_id = google_service_account.service_account[each.key].name
  public_key_type    = each.value.public_key_type
  private_key_type   = each.value.private_key_type
  key_algorithm      = each.value.key_algorithm
  keepers = {
    rotation_time = each.value.key_rotation == false ? time_rotating.default_key_rotation.rotation_days : time_rotating.sa_key_rotation[each.key].rotation_days
  }
}