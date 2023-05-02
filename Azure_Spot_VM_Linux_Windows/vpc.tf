resource "azurerm_virtual_network" "vnet" {
  name                = "vnet_west_us"
  address_space       = ["10.0.0.0/20"]
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group.name
  tags                = var.tags
}

resource "azurerm_subnet" "subnet" {
  name                 = "public-snet"
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0/22"]
}