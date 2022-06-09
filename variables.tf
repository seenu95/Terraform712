variable "hub_rg_name" {
  type = string
}
variable "hub_rg_location" {
  type = string
}
variable "hub_vnet_name" {
  type = string
}
variable "hub_vnet_address" {
}
variable "hub_subnet1_name" {
  type = string
}
variable "hub_subnet1_address_space" {
}
variable "spoke1_rg_name" {
  type = string
}
variable "spoke1_rg_location" {
  type = string
}
variable "spoke1_vnet_name" {
  type = string
}
variable "spoke1_vnet_address" {
}
variable "spoke1_subnet1_name" {
  type = string
}
variable "spoke1_subnet1_address_space" {
}
variable "hub_2_spoke_peering_name" {
  type = string
}
variable "spoke_2_hub_peering_name" {
  type = string
}
variable "keyvault_name" {
  type = string
}
variable "keyvault_rg_name" {
  type = string
}
variable "keyvault_rg_location" {
  type = string
}
variable "keyvault_sku" {
  type = string
}
variable "sql_rg_name" {
  type = string
}
variable "sql_rg_location" {
  type = string
}
variable "sql_server_name" {
  type = string
}
variable "sql_user_name" {
  type = string
}
variable "sql_password" {
  type = string
}
variable "pvt_keyvault_endpoint_name" {
  type = string
}
variable "pvt_sql_endpoint_name" {
  type = string
}
variable "vm_name" {
  type = string
}
variable "vm_location" {
  type = string
}
variable "vm_rg" {
  type = string
}
variable "vm_size" {
  type = string
}
variable "vm_username" {
  type = string
}
variable "vm_password" {
  type = string
}
variable "os_version" {
  type = string
}
variable "bastion_rg_name" {
  type = string
}
variable "bastion_location" {
  type = string
}
variable "bastion_vnet_name" {
  type = string
}
variable "bastion_vnet_rg" {
}
variable "bastion_subnet_address" {
  type = string
}
variable "bastion_pip_name" {
  type = string
}
variable "bastion_host_name" {
  type = string
}
variable "bastion_configuration_name" {
  type = string
}
variable "firewall_vnet_rg_name" {
  type = string
}
variable "firewall_location" {
  type = string
}
variable "firewall_vnet_name" {
  type = string
}
variable "firewall_subnet_address" {
  type = string
}
variable "firewall_pip_name" {
  type = string
}
variable "firewall_name" {
  type = string
}
variable "configuration_name" {
  type = string
}
variable "webapp_rgname" {
  type = string
}
variable "webapp_location" {
  type = string
}
variable "webapp_name" {
  type = string
}
variable "webapp_aspname" {
  type = string
}
variable "webapp_version" {
  type = string
}
variable "webapp_sku_asp_tier" {
  type = string
}
variable "webapp_sku_asp_size" {
  type = string
}
variable "webapp_slot_name" {
  type = string
}
variable "aks_rg_name" {
  type = string
}
variable "aks_cluster_name" {
  type = string
}
variable "aks_vm_size" {
  type = string
}
variable "aks_node_pool_name" {
  type = string
}
variable "aks_node_count" {
  type = string
}
variable "aks_location" {
  type = string
}
variable "aks_dns_prefix" {
  type = string
}