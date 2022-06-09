terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.97.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscriptionshub
  tenant_id       = var.tenant
  client_id       = var.client
  client_secret   = var.secret
}