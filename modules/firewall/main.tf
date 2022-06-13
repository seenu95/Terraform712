terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

resource "azurerm_subnet" "firewall" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = var.firewall_vnet_rg_name
  virtual_network_name = var.firewall_vnet_name
  address_prefixes     = var.firewall_subnet_address
}

resource "azurerm_public_ip" "firewall" {
  name                = var.firewall_pip_name
  location            = var.firewall_location
  resource_group_name = var.firewall_vnet_rg_name
  allocation_method   = "Static"
  sku                 = "Standard"#var.firewall_pip_sku
}

resource "azurerm_firewall" "firewall" {
  name                = var.firewall_name
  location            = azurerm_public_ip.firewall.location
  resource_group_name = var.firewall_vnet_rg_name

  ip_configuration {
    name                 = var.configuration_name
    subnet_id            = azurerm_subnet.firewall.id
    public_ip_address_id = azurerm_public_ip.firewall.id
  }
}