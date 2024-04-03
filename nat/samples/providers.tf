terraform {
  experiments = [module_variable_optional_attrs]
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.90.0"
    }
  }
}


provider "google" {
  project = "altimetrik-root"
  region  = "us-central1"
  #credentials = "../../terraform-admin-key.json"
  credentials = "double-skyline-367316-97bf3012d80e.json"
}

/*
provider "google" {
  credentials = "altimetrik-root-key.json"
}*/

