data "azurerm_client_config" "current" {}

data "azurerm_subnet" "this" {
  name                 = var.snet
  virtual_network_name = var.vnet
  resource_group_name  = var.snet_resource_group
}

data "azurerm_role_definition" "key_vault_secret_officer_access" {
  name = "Key Vault Secrets Officer"
}

data "azuread_group" "key_vault_secret_officer_access" {
  display_name     = "TI-Infra-azure"
  security_enabled = true
}
