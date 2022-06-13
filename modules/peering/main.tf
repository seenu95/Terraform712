terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

resource "azurerm_virtual_network_peering" "hub_2_spoke" {
  name                      = var.hub_2_spoke_peering_name
  resource_group_name       = var.hub_rg_name
  virtual_network_name      = var.hub_vnet_name
  remote_virtual_network_id = var.spoke_vnet_id
  allow_gateway_transit     = true
}

resource "azurerm_virtual_network_peering" "spoke_2_hub" {
  name                      = var.spoke_2_hub_peering_name
  resource_group_name       = var.spoke_rg_name
  virtual_network_name      = var.spoke_vnet_name
  remote_virtual_network_id = var.hub_vnet_id
  allow_gateway_transit     = true
}
