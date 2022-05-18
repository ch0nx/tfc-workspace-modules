variable "name" {}
variable "location" {}
variable "username" {}
variable "password" {}

provider "azurerm" {
  features {}
}

variable "vnet_address_spacing" {
  type = list
}

variable "subnet_address_prefixes" {
  type = list
}

resource "azurerm_subnet" "module" {
  version = ">=0.12.0"
  name                 = "${local.module_name}-subnet${count.index}"
  count                = length(var.subnet_address_prefixes)
  resource_group_name  = azurerm_resource_group.module.name
  virtual_network_name = azurerm_virtual_network.module.name
  address_prefixes       = [var.subnet_address_prefixes[count.index]]
}
