# // Module Call -- initialzise / creaties fodler under organization
# module "terraform-gcp-folders" {
#   source       = "../modules/folders"
#   folder_block = var.folder_block
# }

# #Service Account Module
# module "terraform-gcp-sa" {
#   source                 = "../modules/service_accounts"
#   service_accounts_block = var.service_accounts_block
# }

# #Custom Roles Module For Organization
# module "terraform-gcp-organization-iam-custom-roles" {
#   source                              = "../modules/organization_iam_custom_roles"
#   iam_organization_custom_roles_block = var.iam_organization_custom_roles_block
# }

# #Custom Roles Module For Projects
# module "terraform-gcp-project-iam-custom-roles" {
#   source                              = "../modules/project_iam_custom_roles"
#   iam_project_custom_roles_block      = var.iam_project_custom_roles_block
# }

# #creation of routers in a project
 module "terraform-gcp-routers" {
   source       = "../modules/routers"
   router_block = var.router_block
 }

#Creation of vpc in project
module "terraform-gcp-vpc" {
  source    = "../modules/vpc"
  vpc_block = var.vpc_block
}

#Creation of subnet under vpc
module "terraform-gcp-subnet" {
  source    = "../modules/subnet"
  vpc_block = var.vpc_block
  vpc_id    = module.terraform-gcp-vpc.vpc_id
  depends_on = [
    module.terraform-gcp-vpc
  ]
}