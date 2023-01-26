include {
  path = find_in_parent_folders()
}

remote_state {
  backend = "azurerm"

  config = {
    key = "${path_relative_to_include()}.tfstate"
    resource_group_name = "abh1rgeaus1ncplt001"
    storage_account_name = "abh1steaus1nctfst001"
    container_name = "tfstate"
  }
}


inputs = {

  vm_identifier  =  "001"

  size  = "Standard_D1_v2"

  os_disk = {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb  = "50"
  }

  image_info = {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "7.5"
    version   = "latest"
  }

  resource_group = path_relative_to_include()
  snet_resource_group = "abh1rgeaus1ncplt001"
  vnet = "abh1vneteaus1ncplt001"
  snet = "abh1sneteaus1nchml001"

  key_vault_ip_rules = "177.75.206.226"

  allow_extension_operations = true

  management_group                = "ab"
  purpose                         = "linuxfs"
  environment                     = "h1"
  region                          = "eaus1"
  critical_to_business_continuity = "nc"

  disable_password_authentication = true

  ip_configuration_name = "ipconfig1"
  private_ip_address_allocation = "Static"
  private_ip_address = "10.34.1.199"

  enable_boot_diagnostics = true

  tags = {
    "context"                          = "arbi"
    "critical_for_business_continuity" = "nc"
    "environment"                      = "h1"
    "management_group"                 = "ab"
    "project"                          = "sistema-funcao"
    "purpose"                          = "linuxfs"
  }
}
