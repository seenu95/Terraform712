terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

resource "azurerm_subnet" "s2svpn" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.s2svpn.name
  virtual_network_name = var.hub_vnet_name
  address_prefixes     = var.gateway_address
}

resource "azurerm_local_network_gateway" "onpremise" {
  name                = var.lng_name
  location            = var.vpn_rg_location
  resource_group_name = var.vpn_rg_name
  gateway_address     = var.lng_public_ip
  address_space       = var.lng_address_space
}

resource "azurerm_public_ip" "s2svpn" {
  name                = var.vng_pip_name
  location            = var.vpn_rg_location
  resource_group_name = var.vpn_rg_name
  allocation_method   = "Dynamic"
}

resource "azurerm_virtual_network_gateway" "s2svpn" {
  name                = var.vng_name
  location            = var.vpn_rg_location
  resource_group_name = var.vpn_rg_name

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = var.vng_sku

  ip_configuration {
    public_ip_address_id          = azurerm_public_ip.s2svpn.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.s2svpn.id
  }
}

resource "azurerm_virtual_network_gateway_connection" "onpremise" {
  name                = var.vpn_connection_name
  location            = var.vpn_rg_location
  resource_group_name = var.vpn_rg_name

  type                       = var.vpn_encryption_type
  virtual_network_gateway_id = azurerm_virtual_network_gateway.s2svpn.id
  local_network_gateway_id   = azurerm_local_network_gateway.onpremise.id

  shared_key = var.vpn_shared_key
}