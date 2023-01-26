resource "azurerm_key_vault" "this" {

  depends_on = [azurerm_resource_group.this]

  name                        = "${var.management_group}${var.environment}kv${var.region}${var.critical_to_business_continuity}${var.purpose}001"
  location                    = azurerm_resource_group.this.location
  resource_group_name         = azurerm_resource_group.this.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name                    = "standard"
  enable_rbac_authorization   = true

  network_acls {
    bypass                     = "AzureServices"
    default_action             = "Deny"
    virtual_network_subnet_ids = [data.azurerm_subnet.this.id]
    ip_rules                   = [var.key_vault_ip_rules != null ? var.key_vault_ip_rules : null]
  }
}

resource "azurerm_role_assignment" "key_vault_secrets_adminaccess" {
  scope                = azurerm_key_vault.this.id
  role_definition_name = data.azurerm_role_definition.key_vault_secret_officer_access.name
  principal_id         = data.azuread_group.key_vault_secret_officer_access.id
}

