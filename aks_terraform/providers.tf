terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "< 4.0"
    }
    azapi = {
      source  = "Azure/azapi"
      version = ">=1.13.0, <3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  //client_id =
  //client_secret =
}

provider "azapi" {
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  //client_id =
  //client_secret =
}
