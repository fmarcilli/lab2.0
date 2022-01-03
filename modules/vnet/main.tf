# VNET

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  #resource_group_name = var.rg_name
  resource_group_name = data.resource_group_name.rg_all
}

resource "azurerm_subnet" "subnet" {
  name                 = "int"
  #resource_group_name = var.rg_name
  resource_group_name = data.resource_group_name.rg_all
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.address_prefixes
  
}





