terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

resource "azurerm_resource_group" "cluster" {
  name     = var.aks_rg_name
  location = var.aks_location
}

resource "azurerm_kubernetes_cluster" "cluster" {
  name = var.aks_cluster_name
  location = azurerm_resource_group.cluster.location
  resource_group_name = azurerm_resource_group.cluster.name
  dns_prefix = var.aks_dns_prefix
  
  default_node_pool {
    name = "default"
    node_count = var.aks_node_count
    vm_size = var.aks_vm_size
  }

  identity {
    type = "SystemAssigned"
  }
  http_application_routing_enabled = true
}
