/*Details on the Hub Vnet*/
hub_rg_name      = "HUB-VNET01-RG001"
hub_rg_location  = "eastus2"
hub_vnet_name    = "HUB-VNET01"
hub_vnet_address = "10.0.0.0/16"

/*Details on the Hub Subnet 1*/
hub_subnet1_name          = "HUB-VNET01-SN001"
hub_subnet1_address_space = "10.0.0.0/24"

/*Details on the Spoke Vnet 1*/
spoke1_rg_name      = "SPK-VNET01-RG001"
spoke1_rg_location  = "eastus2"
spoke1_vnet_name    = "SPK-VNET01"
spoke1_vnet_address = "10.10.0.0/16"

/*Details on the Spoke Subnet 1*/
spoke1_subnet1_name          = "SPK-VNET01-SN001"
spoke1_subnet1_address_space = "10.10.0.0/24"

/*Details on Hub and Spoke peering*/
hub_2_spoke_peering_name = "HUB-VNET01-SPK-VNET01"
spoke_2_hub_peering_name = "SPK-VNET01-HUB-VNET01"

/*Keyvault details */
keyvault_name        = "HUB-VLT001"
keyvault_rg_name     = "HUB-VNET01-RG001"
keyvault_rg_location = "eastus2"
keyvault_sku         = "standard"

/*SQL Paas instance details*/
sql_rg_name     = "HUB-SQL-RG001" #### NEW rg CREATE
sql_rg_location = "eastus2"
sql_server_name = "hubwdbs001"
sql_user_name   = "sqluser"
sql_password    = "User@2022sql"

/*Keyvault Private endpoint*/
pvt_keyvault_endpoint_name = "keyvaultpvtendpoint"


/*SQL Private endpoint details*/
pvt_sql_endpoint_name = "hubdbspvtendpoint"

/*Web Server details*/
vm_name     = "HUBWWEB001"
vm_location = "eastus2"
vm_rg       = "HUB-APP-ESHOP-RG001"
vm_size     = "Standard_F2"
vm_username = "adminuser"
vm_password = "P@$$w0rd1234!"
os_version  = "2016-Datacenter"

/*Bastion server*/
bastion_rg_name            = "HUB-BST-RG001"
bastion_location           = "eastus2"
bastion_vnet_name          = "HUB-VNET01"
bastion_vnet_rg            = "HUB-VNET01-RG001"
bastion_subnet_address     = "10.0.10.0/24"
bastion_pip_name           = "HUBBST001-PIP"
bastion_host_name          = "HUBBST001"
bastion_configuration_name = "bastion-config"

/*Azure Firewall*/
firewall_location       = "eastus2"
firewall_vnet_name      = "HUB-VNET01"
firewall_vnet_rg_name   = "HUB-VNET01-RG001"
firewall_subnet_address = "10.0.11.0/24"
firewall_pip_name       = "HUBAZFW001-PIP"
firewall_name           = "HUBAZFW001"
configuration_name      = "HUBBST001-config"

## ##/* S2S VPN details */  SKIP
## ##vpn_rg_name     = "HUB-VNET01-RG001"
## ##vpn_rg_location = "eastus2"
## ####hub_vnet_name       ="HUB-VNET01"
## ##gateway_address     = "10.0.12.0/24"
## ##lng_name            = "vpn-lng"
## ##lng_public_ip       = "lng-pip"
## ##lng_address_space   = "192.168.0.0/24"
## ##vng_pip_name        = "vng-pip"
## ##vng_name            = "vpn-vng"
## ##vng_sku             = "VpnGw2"
## ##vpn_connection_name = "S2Sconnection"
## ##vpn_encryption_type = "IPsec"
## ##vpn_shared_key      = "4-v3ry-53cr37-1p53c-5h4r3d-k3y"
## 
/* AKS Cluster */
aks_rg_name        = "ltiwebapp-rg"
aks_cluster_name   = "ltiwebapp-aks"
aks_vm_size        = "standard_d2_v2"
aks_node_pool_name = "ltiwebapp-nodepool"
aks_node_count     = "1"
aks_location       = "eastus2"
aks_dns_prefix     = "webaks"

/* Web App */
webapp_rgname       = "webapp-rg"
webapp_location     = "eastus2"
webapp_name         = "lti-webappbubul1"
webapp_aspname      = "lti-webappbubul1-asp"
webapp_version      = "v4.0"
webapp_sku_asp_tier = "Standard"
webapp_sku_asp_size = "S1"
webapp_slot_name    = "staging"