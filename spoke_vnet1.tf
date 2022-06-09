###========= Spoke1 Vnet ==========

resource "azurerm_resource_group" "spoke1_vnet" {
  name     = var.spoke1_rg_name
  location = var.spoke1_rg_location
}

module "spoke1_vnet" {
  source             = "./modules/vnet"
  vnet_name          = var.spoke1_vnet_name
  vnet_rg_location   = azurerm_resource_group.spoke1_vnet.location
  vnet_rg_name       = azurerm_resource_group.spoke1_vnet.name
  vnet_address_space = var.spoke1_vnet_address
}

###========= Hub Subnetnet ==========

module "spoke1_subnet1" {
  source           = "./modules/subnet"
  subnet_name      = var.spoke1_subnet1_name
  vnet_name        = module.spoke1_vnet.name
  subnet_rg_name   = module.spoke1_vnet.resource_group_name
  subnet_addresses = [var.spoke1_subnet1_address_space]
}

#===== Hub and Spoke Vnet Peering =====
module "peering1" {
  source                   = "./modules/peering"
  hub_2_spoke_peering_name = var.hub_2_spoke_peering_name
  hub_rg_name              = azurerm_resource_group.hub_vnet.name
  hub_vnet_name            = module.hub_vnet.name
  spoke_vnet_id            = module.spoke1_vnet.vnet_id

  spoke_2_hub_peering_name = var.spoke_2_hub_peering_name
  spoke_rg_name            = azurerm_resource_group.spoke1_vnet.name
  spoke_vnet_name          = module.spoke1_vnet.name
  hub_vnet_id              = module.hub_vnet.vnet_id
}

#========== AKS Cluster ==============
module "AKS" {
  source             = "./modules/AKS"
  aks_rg_name        = var.aks_rg_name
  aks_location       = var.aks_location
  aks_vm_size        = var.aks_vm_size
  aks_node_count     = var.aks_node_count
  aks_cluster_name   = var.aks_cluster_name
  aks_node_pool_name = var.aks_node_pool_name
  aks_dns_prefix     = var.aks_dns_prefix
}
