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

variable "rgname" { 
  type = string
  default = "myTFResourceGroupCloud"
}

variable "mylocation" { 
  type = string
  default = "westus2"
}


resource "azurerm_resource_group" "rg" {
  name     = var.rgname
  location = var.mylocation
}

resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  location            = var.mylocation
  resource_group_name = var.rgname

  address_space       = ["10.3.0.0/16"]
  dns_servers         = ["10.3.0.4", "10.3.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.3.1.0/24"
  }
}
