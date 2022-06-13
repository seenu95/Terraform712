terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

resource "azurerm_resource_group" "azkeyvault" {
  name     = var.keyvault_rg_name
  location = var.keyvault_rg_location
}

data "azurerm_client_config" "current" {}
resource "azurerm_key_vault" "azkeyvault" {
  name                        = var.keyvault_name
  location                    = azurerm_resource_group.azkeyvault.location
  resource_group_name         = azurerm_resource_group.azkeyvault.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled    = false

  sku_name = var.keyvault_sku #"standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "get",
    ]

    secret_permissions = [
      "get",
    ]

    storage_permissions = [
      "get",
    ]
  }

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
  }

}
