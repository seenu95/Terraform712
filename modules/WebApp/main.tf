terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}
resource "azurerm_resource_group" "rg" {
  name    = var.webapp_rgname
  location = var.webapp_location
}

resource "azurerm_app_service_plan" "webappasp" {
  name                = var.webapp_aspname
  location            = var.webapp_location
  resource_group_name = azurerm_resource_group.rg.name
  sku {
    tier = var.webapp_sku_asp_tier #"Standard"
    size = var.webapp_sku_asp_size #"S1"
  }
}

resource "azurerm_app_service" "webappname" {
  name                = var.webapp_name
  location            = var.webapp_location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.webappasp.id

  site_config {
    dotnet_framework_version = var.webapp_version #"v4.0"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }
}

resource "azurerm_app_service_slot" "app-slot" {
  name                = var.webapp_slot_name
  app_service_name    = azurerm_app_service.webappname.name
  location            = var.webapp_location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.webappasp.id

  site_config {
    dotnet_framework_version = var.webapp_version #"v4.0"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }
}

