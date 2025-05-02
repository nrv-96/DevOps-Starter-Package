module "avm-res-network-virtualnetwork" {
  source              = "Azure/avm-res-network-virtualnetwork/azurerm"
  version             = "0.8.1"
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  enable_telemetry    = false
  tags                = var.tags
  subnets = {
    for name, subnet in var.subnets : name => {
      name              = name
      address_prefix    = subnet.cidr
      service_endpoints = subnet.service_endpoints
    }
  }
}

