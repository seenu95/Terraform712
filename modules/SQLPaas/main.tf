terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

resource "azurerm_resource_group" "example" {
  name     = var.sql_rg_name
  location = var.sql_rg_location
}

resource "azurerm_mssql_server" "sql_paas" {
  name                         = var.sql_server_name
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = var.sql_user_name
  administrator_login_password = var.sql_password
  minimum_tls_version          = "1.2"
}