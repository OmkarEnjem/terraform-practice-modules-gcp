#Output Service Account Name
output "service_account_ids" {
  description = "Service Account Name"
  value = tomap({
    for k, service_account in google_service_account.service_account : k => service_account.unique_id
  })
}

#Output Service Account IAM Binding
output "service_account_iam_binding" {
  description = "Service Account IAM Roles"
  value = tomap({
    for k, admin_account_iam in google_service_account_iam_binding.admin_account_iam : k => admin_account_iam.role
  })
}

#Output Service Account IAM Members
output "service_account_iam_members" {
  description = "Service Account IAM Members"
  value = tomap({
    for k, admin_account_iam in google_service_account_iam_binding.admin_account_iam : k => admin_account_iam.members
  })
}

#Output Service Account Key Rotation Time
output "rotation_days" {
  description = "Service Account Key Rotation Time"
  value = tomap({
    for k, sa_key_rotation in time_rotating.sa_key_rotation : k => sa_key_rotation.id
  })
}

#Output Service Account Public Key
output "service_account_public_key" {
  description = "Service Account Public Key"
  value = tomap({
    for k, service_account_key in google_service_account_key.service_account_key : k => service_account_key.public_key
  })
}

#Output Service Account Private Key
output "service_account_private_key" {
  description = "Service Account private Key"
  value = tomap({
    for k, service_account_key in google_service_account_key.service_account_key : k => service_account_key.private_key
  })
  sensitive = true
}