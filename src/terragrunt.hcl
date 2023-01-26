terraform {
  source = "..//resources"
}

terraform_version_constraint = "~> 1.3.0"

terragrunt_version_constraint = "> 0.42.0"

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
terraform {
  required_version = "~> 1.2"
  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.93.1"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.15.0"
    }
  }
}
provider "azurerm" {
  features {}
}
EOF
}
