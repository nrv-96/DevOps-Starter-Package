terraform {
  required_version = ">= 1.7.4"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.94.0" #https://registry.terraform.io/providers/hashicorp/azurerm/latest
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.12.1" #https://registry.terraform.io/providers/hashicorp/helm/latest
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.26.0" #https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0" //https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs
    }
    local = {
      source = "hashicorp/local"
      version = "2.4.1" #https://registry.terraform.io/providers/hashicorp/local/latest/docs 
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}
