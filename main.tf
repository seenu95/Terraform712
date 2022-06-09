###========= Hub Vnet ==========

resource "azurerm_resource_group" "hub_vnet" {
  name     = var.hub_rg_name
  location = var.hub_rg_location
}

module "hub_vnet" {
  source             = "./modules/vnet"
  vnet_name          = var.hub_vnet_name
  vnet_rg_location   = azurerm_resource_group.hub_vnet.location
  vnet_rg_name       = azurerm_resource_group.hub_vnet.name
  vnet_address_space = var.hub_vnet_address
}

###========= Hub Subnet ==========

module "hub_subnet1" {
  source           = "./modules/subnet"
  subnet_name      = var.hub_subnet1_name
  vnet_name        = module.hub_vnet.name
  subnet_rg_name   = module.hub_vnet.resource_group_name
  subnet_addresses = [var.hub_subnet1_address_space]
}

###========= Keyvault ==========
module "keyvault" {
  source               = "./modules/Keyvault"
  keyvault_name        = var.keyvault_name
  keyvault_rg_name     = var.keyvault_rg_name
  keyvault_rg_location = var.keyvault_rg_location
  keyvault_sku         = var.keyvault_sku
}

resource "azurerm_private_endpoint" "pe_kv" {
  name                = var.pvt_keyvault_endpoint_name
  location            = var.keyvault_rg_location
  resource_group_name = var.keyvault_rg_name
  subnet_id           = module.hub_subnet1.id

  private_service_connection {
    name                           = var.pvt_keyvault_endpoint_name
    private_connection_resource_id = module.keyvault.id
    is_manual_connection           = false
    subresource_names              = ["Vault"]
  }
}


###========= SQL PaaS ==========
module "sql" {
  source          = "./modules/SQLPaas"
  sql_rg_name     = var.sql_rg_name
  sql_rg_location = var.sql_rg_location
  sql_server_name = var.sql_server_name
  sql_user_name   = var.sql_user_name
  sql_password    = var.sql_password
}

###========= SQL Private endpoint ==========

resource "azurerm_private_endpoint" "sql" {
  name                = var.pvt_sql_endpoint_name
  location            = var.sql_rg_location
  resource_group_name = var.sql_rg_name
  subnet_id           = module.hub_subnet1.id

  #module.hub_subnet5.id

  private_service_connection {
    name                           = var.pvt_sql_endpoint_name
    private_connection_resource_id = module.sql.id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }
}

###========= Web Server ==========

resource "azurerm_resource_group" "vm" {
  name     = var.vm_rg
  location = var.vm_location
}


module "webserver" {
  source      = "./modules/webserver"
  vm_name     = var.vm_name
  vm_location = azurerm_resource_group.vm.location
  vm_rg       = azurerm_resource_group.vm.name
  subnet_id   = module.hub_subnet1.id
  vm_size     = var.vm_size
  vm_username = var.vm_username
  vm_password = var.vm_password
  os_version  = var.os_version
}

###========= Bastion server ==========
module "bastion" {
  source                     = "./modules/bastion"
  bastion_rg_name            = var.bastion_rg_name
  bastion_location           = var.bastion_location
  bastion_vnet_name          = module.hub_vnet.name
  bastion_vnet_rg            = module.hub_vnet.resource_group_name
  bastion_subnet_address     = [var.bastion_subnet_address]
  bastion_pip_name           = var.bastion_pip_name
  bastion_host_name          = var.bastion_host_name
  bastion_configuration_name = var.bastion_configuration_name
}

###========= Azure firewall ==========
module "azure_firewall" {
  source                  = "./modules/firewall"
  firewall_location       = var.firewall_location
  firewall_vnet_name      = module.hub_vnet.name
  firewall_vnet_rg_name   = module.hub_vnet.resource_group_name
  firewall_subnet_address = [var.firewall_subnet_address]
  firewall_pip_name       = var.firewall_pip_name
  firewall_name           = var.firewall_name
  configuration_name      = var.configuration_name
}

## #####========= S2S VPN ==========
## ##module "s2svpn" {
## ##  source              = "./modules/s2svpn"
## ##  vpn_rg_name         = var.vpn_rg_name
## ##  vpn_rg_location     = var.vpn_rg_location
## ##  hub_vnet_name       = var.hub_vnet_name
## ##  gateway_address     = var.gateway_address
## ##  lng_name            = var.lng_name
## ##  lng_public_ip       = var.lng_public_ip
## ##  lng_address_space   = var.lng_address_space
## ##  vng_pip_name        = var.vng_pip_name
## ##  vng_name            = var.vng_name
## ##  vng_sku             = var.vng_sku
## ##  vpn_connection_name = var.vpn_connection_name
## ##  vpn_encryption_type = var.vpn_encryption_type
## ##  vpn_shared_key      = var.vpn_shared_key
## ##}
## ##
###========= Web App ===========
module "WebApp" {
  source              = "./modules/WebApp"
  webapp_rgname       = var.webapp_rgname
  webapp_location     = var.webapp_location
  webapp_name         = var.webapp_name
  webapp_aspname      = var.webapp_aspname
  webapp_version      = var.webapp_version
  webapp_sku_asp_tier = var.webapp_sku_asp_tier
  webapp_sku_asp_size = var.webapp_sku_asp_size
  webapp_slot_name    = var.webapp_slot_name
}