output "vm_id" {
  description = " The ID of the Virtual Machine."
  value       = module.linux_virtual_machine.vm_id
}

output "password_id" {
  description = "ID of the Key Vault Secret where the VM's Admin Password is stored."
  value       = var.disable_password_authentication ? null : module.linux_virtual_machine.password_id
}

output "password_version" {
  description = "Version of the Key Vault Secret where the VM's Admin Password is stored."
  value       = var.disable_password_authentication ? null : module.linux_virtual_machine.password_version.0
}

output "ssh_key_id" {
  description = "ID of the Key Vault Secret where the VM's SSH key is stored."
  value       = var.disable_password_authentication ? module.linux_virtual_machine.ssh_key_id : null
}

output "ssh_key_version" {
  description = "Version of the Key Vault Secret where the VM's SSH key is stored."
  value       = var.disable_password_authentication ? module.linux_virtual_machine.ssh_key_version : null
}
