module "linux_virtual_machine" {
  source = "git@github.com:BancoArbi/terraform-azurerm-module-linux-vm.git?ref=fix/names"

  depends_on = [
    azurerm_resource_group.this, azurerm_key_vault.this
  ]

  vm_identifier  = var.vm_identifier
  size           = var.size
  os_disk        = var.os_disk
  image_info     = var.image_info
  image_id       = var.source_image_id
  resource_group = var.resource_group

  allow_extension_operations = var.allow_extension_operations

  network_interfaces = [
    {
      ip_configuration_name         = var.ip_configuration_name
      subnet_id                     = data.azurerm_subnet.this.id
      private_ip_address_allocation = var.private_ip_address_allocation
      private_ip_address            = var.private_ip_address
    }
  ]

  key_vault_resource_group = azurerm_resource_group.this.name
  key_vault                = azurerm_key_vault.this.name

  disable_password_authentication = var.disable_password_authentication

  management_group                = var.management_group
  purpose                         = var.purpose
  environment                     = var.environment
  region                          = var.region
  critical_to_business_continuity = var.critical_to_business_continuity

  tags = var.tags

}
