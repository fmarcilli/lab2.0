# VNET

data "azurerm_resource_group" "rg_all" {
  name = "FilipeLABS1"
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.address_space
  location             = "${data.azurerm_resource_group.rg_all.location}" 
  resource_group_name  = "${data.azurerm_resource_group.rg_all.name}" 
 
  # location            = var.location
  # resource_group_name = var.rg_name
 
}

resource "azurerm_subnet" "subnet" {
  name                 = "int"
  #resource_group_name = var.rg_name
  resource_group_name  = "${data.azurerm_resource_group.rg_all.name}" 
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.address_prefixes
  
}





