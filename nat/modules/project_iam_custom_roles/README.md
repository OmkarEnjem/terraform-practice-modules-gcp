#This block will create custom project IAM roles 
resource "google_project_iam_custom_role" "my-custom-project-roles"
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| varible               		| Mandatory   | Type   |       Description                                                                                                                    |
|-------------------------------|-------------|--------|--------------------------------------------------------------------------------------------------------------------------------------|
| iam_project_custom_roles_block| Yes         | map    | Its a parent object                                                                                                                  |
| role_id               		| Yes         | string | Name/id of the role                                                                                                                  |
| title                 		| Yes         | string | Name of the title                                                                                                                    |
| prefix                		| No          | String | It is the prefix attached to service account name                                                                                    |
| permissions           		| Yes         | List   | List of permissions                                                                                                                  |
| description           		| No          | string | Service account description                                                                                                          |
| project               		| No          | string | Under which project role to be created. Defaults to the provider project configuration.                                              |
| stage                 		| No          | string | Deafult to GA.(General Availaibiltiy)                                                                                                |
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

Import:

Custom Roles can be imported using any of these accepted formats:

$ terraform import module.terraform-gcp-project-iam-custom-roles.google_project_iam_custom_role.default projects/{{project}}/roles/{{role_id}}
$ terraform import module.terraform-gcp-project-iam-custom-roles.google_project_iam_custom_role.default {{project}}/{{role_id}}
$ terraform import module.terraform-gcp-project-iam-custom-roles.google_project_iam_custom_role.default {{role_id}}