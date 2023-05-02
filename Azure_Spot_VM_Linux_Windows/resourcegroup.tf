resource "azurerm_resource_group" "resource_group" {
  name     = "pag-rg-west-us-2"
  location = var.location
}