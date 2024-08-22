variable "location" {
  default = "westindia" #Azure Locations: "australiacentral,australiacentral2,australiaeast,australiasoutheast,brazilsouth,brazilsoutheast,brazilus,canadacentral,canadaeast,centralindia,centralus,centraluseuap,eastasia,eastus,eastus2,eastus2euap,francecentral,francesouth,germanynorth,germanywestcentral,japaneast,japanwest,jioindiacentral,jioindiawest,koreacentral,koreasouth,northcentralus,northeurope,norwayeast,norwaywest,polandcentral,qatarcentral,southafricanorth,southafricawest,southcentralus,southeastasia,southindia,swedencentral,swedensouth,switzerlandnorth,switzerlandwest,uaecentral,uaenorth,uksouth,ukwest,westcentralus,westeurope,westindia,westus,westus2,westus3,austriaeast,chilecentral,eastusslv,israelcentral,israelnorthwest,italynorth,malaysiasouth,mexicocentral,spaincentral,taiwannorth,taiwannorthwest"
  type    = string
}

variable "tags" {
  type = map(string)
  default = {
    "created_by" = "user"
  }
}

variable "admin_user" {
  type    = string
  default = "azureadmin"
}
