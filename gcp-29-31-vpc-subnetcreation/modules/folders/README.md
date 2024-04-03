--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| varible               | Mandatory   | Type   |       Description                                                                                                                    |                    
|-----------------------|-------------|--------|--------------------------------------------------------------------------------------------------------------------------------------|
| folder_block          | Yes         | map    | Its a parent object                                                                                                                  |
| name                  | Yes         | string | Describe the name of the folder                                                                                                      |
| parent                | yes         | string | Under which organisation or folder we have to create it                                                                              |                         
| prefix                | No          | string | It is the prefix attached to folder name                                                                                             |        
| roles                 | Yes         | map    | It is use to bind the role to a folder.it accept the following variable role , members , condition                                   |
| role_id               | Yes         | string | name of the role                |                                                                                                    |
| members               | yes         | list   | List of users added under above role                                                                                                 |
| condition_creation    | Yes         | bool   | Keep "true"                                                                                                                          |
| condition             | No          | Object | ts accept title , description , expression                                        |                                                  |
| constraints           | yes         | map    | It is use to apply organisazition policy                                                                                             |
| constraint_id         | yes         | string | It used to accept constraint id                                                                                                      |
| inherit_from_parent   | yes         | bool   | Use to inhereit from parent                                                                                                          | 
| deny                  | yes         | bool   | To deny list of policy of the respective constraint_id above                                                                         |
| deny_value            | Yes         | list   | List of policies need to deny                           |                                                                            |
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------