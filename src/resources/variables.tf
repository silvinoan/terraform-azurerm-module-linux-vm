variable "vm_identifier" {
  description = "(Required) The VM identifier, to make it unique among multiple VMs."

  type = string
}

variable "resource_group" {
  description = "(Required) The resource group where the resources will be created"
  type        = string
}

# variable "key_vault" {
#   description = "(Required) The name of the Key Vault in which the VM's Admin Password will be stored."
#   type        = string
#   nullable    = false
# }

# variable "key_vault_resource_group" {
#   description = "(Required) The name of the resource group where is the key vault that will be used. that`s need to be in the same azure region"
#   default     = null
#   type        = string
#   nullable    = true
# }

variable "region" {
  description = "(Required) The azure`s region where the resources will be created"
  type        = string
  default     = "eaus1"

}

variable "tags" {
  description = "(Required) Another tags that can be created"
  type        = map(string)

  nullable = false
}

variable "size" {
  description = "(Optional) The SKU which should be used for this Virtual Machine, such as Standard_F2."
  type        = string
  nullable    = false
}

variable "source_image_reference" {
  description = "(Optional) The Reference of the Image which this Virtual Machine should be created from."
  type        = map(string)
  nullable    = false
  default = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

variable "disable_password_authentication" {
  description = "(Optional) Should Password Authentication be disabled on this Virtual Machine?"
  default     = true
  type        = bool
}

variable "management_group" {
  description = "(Required) The VM's Management Group."

  type     = string
  nullable = false
}

variable "environment" {
  description = "(Required) The VM's Environment."

  type     = string
  nullable = false
}

variable "critical_to_business_continuity" {
  description = "(Required) Is the VM critical to business continuity?"

  type     = string
  nullable = false
}

variable "purpose" {
  description = "(Required) The VM's reason to exist/purpose."

  type     = string
  nullable = false
}

variable "vnet" {
  description = "(Required) The name of the Virtual network which the resouces will use"

  type = string
}

variable "snet" {
  description = "(Required) The name of the Subnet which the resouces will use"

  type = string
}

variable "snet_resource_group" {
  description = "(Required) Snet's resource group name"
  type        = string
  nullable    = false
}


variable "allow_extension_operations" {
  description = "(Optional) Should IP forwarding be enabled?"
  default     = false
  type        = bool
  nullable    = false
}

variable "os_disk" {
  description = "(Required) The basic VM`s OS disk configuration. Minimum size = 30 . Size in GB "
  default = {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = "30"
    name                 = ""
  }
  type     = map(string)
  nullable = false
}

variable "ip_configuration_name" {

}

variable "private_ip_address_allocation" {

}

variable "private_ip_address" {

}

variable "source_image_id" {
  type        = string
  default     = null
}

variable "image_info" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = null
}

variable "key_vault_ip_rules" {
  type        = string
  default     = null
}


