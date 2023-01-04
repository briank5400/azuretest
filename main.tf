# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroupCloud"
  location = "westus2"
}

resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  location            = "westus2"
  resource_group_name = "myTFResourceGroupCloud"

  address_space       = ["10.3.0.0/16"]
  dns_servers         = ["10.3.0.4", "10.3.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.3.1.0/24"
  }
}
