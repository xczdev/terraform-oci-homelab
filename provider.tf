terraform {
  required_version = ">= 1.8.0"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "7.7.0"
    }
  }
}

# Variables for OCI provider configuration
# These variables should be set in a `terraform.tfvars` file or passed as environment variables
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "region" {}
variable "private_key" {
  type      = string
  default   = null
  sensitive = true
}
variable "private_key_path" {
  type    = string
  default = "~/.oci/oci_api_key.pem"
}
provider "oci" {
  tenancy_ocid = var.tenancy_ocid
  user_ocid    = var.user_ocid
  fingerprint  = var.fingerprint
  region       = var.region

  # Use private_key if provided, else use private_key_path
  private_key      = var.private_key != null ? var.private_key : null
  private_key_path = var.private_key != null ? null : var.private_key_path
}
