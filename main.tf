terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}


# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "default" {
  name     = var.rg
  location = var.locat
  tags = {
    "env"     = var.env_tag
    "project" = "myapp"
  }
}


resource "azurerm_kubernetes_cluster" "default" {
  name                = "${var.locat}-${var.kc}"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_A2_v2"
    //vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}