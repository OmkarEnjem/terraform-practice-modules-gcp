/*#Folder structure
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
*/
#Cloud Router structure
router_block = {
  cloud_router_1 = {
    name              = "router-1"
    prefix            = "altimetrik"
    description       = "router1 for vpn connection"
    #project_id        = "omkar-terraform-admin"
    project_id                          = "double-skyline-367316"
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
    name              = "router-2"
    prefix            = "altimetrik"
    description       = "router1 for vpn connection"
    #project_id        = "omkar-terraform-admin"
    project_id                          = "double-skyline-367316"
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

/*
#Cloud Natgateway structure
natgateway_block = {
  cloudnat1 = {
    name   = "uscentral-cloudnat-1"
    router = "zeta-router-1" //"zeta-uscentra1-router-1"
    prefix = "zeta"
    region = "us-central1"
    #project_id                          = "omkar-terraform-admin"
    project_id                          = "double-skyline-367316"
    nat_ip_allocate_option              = "AUTO_ONLY"
    udp_idle_timeout_sec                = "30"
    icmp_idle_timeout_sec               = "30"
    tcp_established_idle_timeout_sec    = "30"
    tcp_transitory_idle_timeout_sec     = "1200"
    enable_endpoint_independent_mapping = true
    reserve_number_of_staticips         = 2
    source_subnetwork_ip_ranges_to_nat  = "ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES" // if not LIST_OF_SUBNETWORKS option here, no need to provide subnet values
    log_config_enable                   = false
    log_config_filter                   = "ERRORS_ONLY"
    # subnetwork = {
    # }
  }

  cloudnat2 = {
    name   = "useast1-cloudnat-1"
    router = "zeta-router-2" //"zeta-useast1-router-1"
    prefix = "zeta"
    region = "us-east1"
    #project_id                          = "omkar-terraform-admin"
    project_id                          = "double-skyline-367316"
    nat_ip_allocate_option              = "MANUAL_ONLY"
    udp_idle_timeout_sec                = "30"
    icmp_idle_timeout_sec               = "30"
    tcp_established_idle_timeout_sec    = "30"
    tcp_transitory_idle_timeout_sec     = "1200"
    enable_endpoint_independent_mapping = true
    reserve_number_of_staticips         = 2
    source_subnetwork_ip_ranges_to_nat  = "LIST_OF_SUBNETWORKS"
    log_config_enable                   = true
    log_config_filter                   = "ERRORS_ONLY"
    subnetwork = {
      subnet1 = {
        name                     = "default"
        source_ip_ranges_to_nat  = ["LIST_OF_SECONDARY_IP_RANGES"]
        secondary_ip_range_names = ["secondary"] //secondary -10.0.1.0/24
      }
    }
  }
}
*/