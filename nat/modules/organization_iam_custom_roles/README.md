#This block will create custom organization IAM roles 
resource "google_organization_iam_custom_role" "my-custom-organization-roles"
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| varible               				| Mandatory   | Type   |       Description                                                                                                                    |
|---------------------------------------|-------------|--------|--------------------------------------------------------------------------------------------------------------------------------------|
| google_organization_iam_custom_role 	| Yes         | map    | Its a parent object                                                                                                                  |
| role_id               				| Yes         | string | Name/id of the role                                                                                                                  |
| org_id                				| Yes         | INT    | Under which org role to be created 																								  |	
| title                 				| Yes         | string | Name of the title                                                                                                                    |
| prefix                				| No          | String | It is the prefix attached to service account name                                                                                    |
| permissions           				| Yes         | List   | List of permissions                                                                                                                  |
| description           				| No          | string | Service account description                                                                                                          |
| project               				| No          | string | Under which project role to be created. Defaults to the provider project configuration.                                              | 
| stage                 				| No          | string | Deafult to GA.(General Availaibiltiy)                                                                                                |
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

Import:

Customized IAM organization role can be imported using their URI, e.g.

$ terraform import module.terraform-gcp-organization-iam-custom-roles.google_organization_iam_custom_role.my-custom-role organizations/{org_id}/roles/myCustomRole
