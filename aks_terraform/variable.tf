variable "rg_name" {
  default     = "aks-rg"
  description = "value of resource group name"
  type        = string
}

variable "rg_location" {
  default     = "eastus"
  description = "value of resource group location"
  type        = string
}

variable "tags" {
  description = "value of resource group tag"
  type        = map(string)
  default = {
    "env"       = "dev"
    "location"  = "value2"
    "terraform" = "true"
  }
}

variable "tenant_id" {
  default     = "7834772d-924a-4eb1-b258-8d3c77a6cc23"
  description = "value of tenant id"
  type        = string
}

variable "subscription_id" {
  default     = "0a457f9a-0b37-4bc0-b7b3-2f712bdb361a"
  description = "value of subscription id"
  type        = string
}

variable "vnet_address_space" {
  default     = ["10.0.0.0/20"]
  description = "Value of vnet address space"
  type        = list(string)
}

variable "vnet_name" {
  default     = "dev-eu-vnet"
  description = "value of vnet name"
  type        = string
}

variable "subnets" {
  description = "Map of subnet configurations"
  type = map(object({
    cidr              = string
    service_endpoints = optional(list(string), []) #Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.ContainerRegistry, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql, Microsoft.Storage, Microsoft.Storage.Global and Microsoft.Web
  }))
  default = {
    "dev-eu-gateway-subnet" = {
      cidr              = "10.0.1.0/27"
      service_endpoints = []
    }
    "dev-eu-common-subnet" = {
      cidr              = "10.0.2.0/24"
      service_endpoints = []
    }
    "dev-eu-bastion-subnet" = {
      cidr              = "10.0.3.0/26"
      service_endpoints = []
    }
    "dev-eu-app-subnet" = {
      cidr              = "10.0.4.0/25"
      service_endpoints = []
    }
    "dev-eu-db-subnet" = {
      cidr              = "10.0.5.0/26"
      service_endpoints = []
    }
    "dev-eu-public-subnet" = {
      cidr              = "10.0.6.0/25"
      service_endpoints = []
    }
    "dev-eu-private-subnet" = {
      cidr              = "10.0.7.0/24"
      service_endpoints = []
    }
    "dev-eu-aks-subnet" = {
      cidr              = "10.0.8.0/22"
      service_endpoints = []
    }
  }
}

# /20	4,094
# /21	2,0464
# /22	1,022
# /23	510
# /24	254
# /25	126
# /26	62
# /27	30
# /28	14
# /29	6
# /30	2
