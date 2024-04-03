#Folder structure
folder_block = {
  hdfc1 = {
    name   = "hdfc",
    parent = "folders/789599227012"
    prefix = "zeta"
    roles = {
      role1 = {
        role_id = "roles/iam.serviceAccountAdmin",
        members = [
          "user:battan.alt@ext.zeta.tech",
          "serviceAccount:test-sa@altimetrik-root.iam.gserviceaccount.com"
        ],
        condition_creation = true
        condition = {
          title       = "expires_after_2021_12_31",
          description = "Expiring at midnight of 2021-12-31",
          expression  = "request.time < timestamp(\"2022-01-01T00:00:00Z\")"
        },
      },
      role2 = {
        role_id = "roles/editor",
        members = [
          "user:battan.alt@ext.zeta.tech"
        ],
        condition_creation = false
        condition = {
          title       = "expires_after_2021_12_31",
          description = "Expiring at midnight of 2021-12-31",
          expression  = "request.time < timestamp(\"2022-01-01T00:00:00Z\")"
        },
      },
    },
    constraints = {
      constraint1 = {
        constraint_id       = "serviceuser.services",
        inherit_from_parent = true
        deny                = true
        deny_value          = ["deploymentmanager.googleapis.com", "compute.googleapis.com"]
      }
    }
  },
  axon1 = {
    name   = "axon",
    parent = "folders/789599227012"
    prefix = ""
    roles = {
      role1 = {
        role_id = "roles/iam.serviceAccountUser",
        members = [
          "user:battan.alt@ext.zeta.tech",
        ],
        condition_creation = true
        condition = {
          title       = "expires_after_2021_12_31",
          description = "Expiring at midnight of 2021-12-31",
          expression  = "request.time < timestamp(\"2022-01-01T00:00:00Z\")"
        },
      },
    },
    constraints = {
      constraint1 = {
        constraint_id       = "serviceuser.services",
        inherit_from_parent = false
        deny                = false
        deny_value          = ["dns.googleapis.com"]
      }
    }
  }
}

#Service Accounts *.tfvars Structure
#Here, account_id should be unique id must be 6-30 characters long and match the regular expression [a-z]([-a-z0-9]*[a-z0-9])
service_accounts_block = {
  hdfc1 = {
    sa_name              = "hdfc1",
    prefix               = "Zeta",
    project_id           = "altimetrik-root",
    account_id           = "hdfc1-12345"
    key_creation         = true
    key_rotation         = false
    sa_key_rotation_days = 30
    public_key_type      = "TYPE_X509_PEM_FILE",
    private_key_type     = "TYPE_GOOGLE_CREDENTIALS_FILE",
    key_algorithm        = "KEY_ALG_RSA_2048",
    description          = "description",
    roles = {
      role1 = {
        role = "roles/iam.serviceAccountAdmin",
        members = [
          "user:battan.alt@ext.zeta.tech",
          "serviceAccount:test-sa@altimetrik-root.iam.gserviceaccount.com",
        ],
        condition_creation = true
        condition = {
          title       = "expires_after_2021_12_31",
          description = "Expiring at midnight of 2021-12-31",
          expression  = "request.time < timestamp(\"2022-01-01T00:00:00Z\")"
        }
      },
    },
  }
  axon1 = {
    sa_name              = "axon1",
    prefix               = "",
    project_id           = "altimetrik-root",
    account_id           = "axon1-12345"
    key_creation         = true
    key_rotation         = true
    sa_key_rotation_days = 90
    public_key_type      = "TYPE_X509_PEM_FILE",
    private_key_type     = "TYPE_GOOGLE_CREDENTIALS_FILE",
    key_algorithm        = "KEY_ALG_RSA_2048",
    description          = "description",
    roles = {
      role1 = {
        role = "roles/iam.serviceAccountAdmin",
        members = [
          "user:battan.alt@ext.zeta.tech",
          "serviceAccount:test-sa@altimetrik-root.iam.gserviceaccount.com",
        ],
        condition_creation = true
        condition = {
          title       = "expires_after_2021_12_31",
          description = "Expiring at midnight of 2021-12-31",
          expression  = "request.time < timestamp(\"2022-01-01T00:00:00Z\")"
        }
      },
      role2 = {
        role = "roles/iam.serviceAccountUser",
        members = [
          "user:battan.alt@ext.zeta.tech",
          "serviceAccount:test-sa@altimetrik-root.iam.gserviceaccount.com",
        ],
        condition_creation = false
        condition = {
          title       = "expires_after_2021_12_31",
          description = "Expiring at midnight of 2021-12-31",
          expression  = "request.time < timestamp(\"2022-01-01T00:00:00Z\")"
        }
      }
    },
  }
}

# Organization custom roles are being added to the project or folders
iam_organization_custom_roles_block = {
  org_role1 = {
    role_id     = "myOrgCustomRoleOne",
    org_id      = "426101460966",
    title       = "My Org Custom Role1",
    prefix      = "zeta",
    description = "A description1",
    permissions = ["iam.roles.list", "iam.roles.create", "iam.roles.delete"],
    stage       = "GA"
  },
  org_role2 = {
    role_id     = "myOrgCustomRoleTwo",
    org_id      = "426101460966",
    title       = "My Org Custom Role2",
    prefix      = "zeta",
    description = "A description2",
    permissions = ["iam.roles.list", "iam.roles.create"],
    stage       = "GA"
  }
}

# Project custom roles are being added to the project
iam_project_custom_roles_block = {
  project_role1 = {
    role_id     = "myCustomRoleOne",
    title       = "My Custom Role1",
    prefix      = "zeta",
    description = "A description1",
    permissions = ["iam.roles.list", "iam.roles.create", "iam.roles.delete"],
    project     = "altimetrik-root",
    stage       = "GA"
  },
  project_role2 = {
    role_id     = "myCustomRoleTwo",
    title       = "My Custom Role2",
    prefix      = "zeta",
    description = "A description2",
    permissions = ["iam.roles.list", "iam.roles.create"],
    project     = "altimetrik-root",
    stage       = "GA"
  }
}
#====================================













#Cloud Router structure
router_block = {
  cloud_router_1 = {
    name              = "devrouter-1"
    prefix            = "altimetrik"
    description       = "router1 for vpn connection"
    project_id        = "double-skyline-367316"
    region            = "us-central1"
    network           = "default"
    asn               = 64512
    advertise_mode    = "CUSTOM"
    advertised_groups = ["ALL_SUBNETS"]
    advertised_ip_ranges = {
      range1 = {
        range = "1.2.3.4"
      }
      range2 = {
        range = "6.7.0.0/16"
      }
    }

  }
  cloud_router_2 = {
    name              = "devrouter-2"
    prefix            = "altimetrik"
    description       = "router1 for vpn connection"
    project_id        = "double-skyline-367316"
    region            = "us-central1"
    network           = "default"
    asn               = 64513
    advertise_mode    = "CUSTOM"
    advertised_groups = ["ALL_SUBNETS"]
    advertised_ip_ranges = {
      range1 = {
        range = "1.2.3.4"
      }
      range2 = {
        range = "6.7.0.0/16"
      }
    }
  }
}

# Vpc structure
vpc_block = {
  network-01 = {
    name                            = "axon-vpc"
    prefix                          = "altimetrik"
    auto_create_subnetworks         = false
    routing_mode                    = "GLOBAL"
    #project_id                      = "directed-fabric-327712"
    project_id                          = "double-skyline-367316"
    mtu                             = 1460
    delete_default_routes_on_create = true
    subnet_block = {
      common_subnet = {
        name                       = "axon-subnet1"
        prefix                     = "altimetrik"
        ip_cidr_range              = "10.0.0.0/24"
        vpc_network                = "network-01"
        project_id                 = "double-skyline-367316"
        #region                     = "asia-south1"
        region            = "us-central1"
        private_ip_google_access   = false
        purpose_of_subnet          = "INTERNAL_HTTPS_LOAD_BALANCER"
        role_of_subnet             = "ACTIVE"
        log_aggregation_interval   = "INTERVAL_5_SEC"
        log_flow_sampling          = 1.0
        log_metadata               = "EXCLUDE_ALL_METADATA"
        log_custom_metadata_fields = [""]
        secondary = {
          range1 = {
            range_name              = "stagezone-common-secondary-1"
            secondary_ip_cidr_range = "10.1.0.0/24"
          },
          range2 = {
            range_name              = "stagezone-common-secondary-2"
            secondary_ip_cidr_range = "10.2.0.0/24"
          }
        }
      }
    }   
  }
  network-02 = {
    name                            = "hdfc-vpc"
    prefix                          = "altimetrik"
    auto_create_subnetworks         = false
    routing_mode                    = "GLOBAL"
    #project_id                      = "directed-fabric-327712"
     project_id                          = "double-skyline-367316"
    mtu                             = 1460
    delete_default_routes_on_create = true
    subnet_block = {
      common_subnet = {
        name                       = "hdfc-subnet"
        prefix                     = "altimetrik"
        ip_cidr_range              = "10.40.0.0/24"
        vpc_network                = "network-02"
        project_id                 = "double-skyline-367316"
        #region                     = "asia-south1"
        region            = "us-central1"
        private_ip_google_access   = true
        purpose_of_subnet          = "PRIVATE"
        role_of_subnet             = ""
        log_aggregation_interval   = "INTERVAL_5_SEC"
        log_flow_sampling          = 1.0
        log_metadata               = "EXCLUDE_ALL_METADATA"
        log_custom_metadata_fields = [""]
        secondary = {
          range1 = {
            range_name              = "ppzone-common-secondary-1"
            secondary_ip_cidr_range = "10.41.0.0/24"
          },
          range2 = {
            range_name              = "ppzone-common-secondary-2"
            secondary_ip_cidr_range = "10.42.0.0/24"
          }
        }
      }
    }
  }

}