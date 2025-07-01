terraform {
  required_version = ">= 1.8.0"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "7.7.0"
    }
  }
}

provider "oci" {
  # Configuration options
}
