terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.subnet_rg_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.subnet_addresses

  enforce_private_link_service_network_policies = true
  service_endpoints = ["Microsoft.Sql","Microsoft.KeyVault"]

  #delegation {
  #  name = "delegation"
  #
  #  service_delegation {
  #    name    = "Microsoft.ContainerInstance/containerGroups"
  #    actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
  #  }
  #}
}