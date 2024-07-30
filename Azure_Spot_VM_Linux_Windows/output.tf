output "windows_pulic_ip" {
  value = azurerm_public_ip.window_vm_publicip.ip_address
}

#output "linux_pulic_ip" {
#  value = azurerm_public_ip.linux_vm_publicip.ip_address
#}

output "windows_vm_password" {
  value     = random_password.windows_vm.result
  sensitive = true
}

#output "linux_vm_password" {
#  value     = random_password.linux_vm.result
#  sensitive = true
#}

variable "subscription_id" {
  default = "0a457f9a-0b37-4bc0-b7b3-2f712bdb361a"
  type = string
}

variable "tenant_id" {
  default = "7834772d-924a-4eb1-b258-8d3c77a6cc23"
  type = string
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}
