output "windows_pulic_ip" {
  value = azurerm_public_ip.window_vm_publicip.ip_address
}

output "linux_pulic_ip" {
  value = azurerm_public_ip.linux_vm_publicip.ip_address
}

output "windows_vm_password" {
  value     = random_password.windows_vm.result
}

output "linux_vm_password" {
  value     = random_password.linux_vm.result
  sensitive = true
}
