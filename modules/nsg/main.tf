data "azurerm_resource_group" "rg_all" {
  name = "RG-FilipeLABS1-dev"
}


resource "azurerm_network_security_group" "nsg-lab" {
  name                = "NSG-${var.project_name}-${var.environment}"
  #location            = var.location
  #resource_group_name = var.rg_name
  location             = "${data.azurerm_resource_group.rg_all.location}" 
  resource_group_name  = "${data.azurerm_resource_group.rg_all.name}" 
}


resource "azurerm_network_security_rule" "testrules" {
  for_each                    = local.nsgrules 
  name                        = each.key
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  #resource_group_name         = var.rg_name
  resource_group_name  = "${data.azurerm_resource_group.rg_all.name}" 
  network_security_group_name = azurerm_network_security_group.nsg-lab.name
}





resource "azurerm_subnet_network_security_group_association" "association-nsg" {
  subnet_id                 = var.subnet_id
  network_security_group_id = azurerm_network_security_group.nsg-lab.id
  #network_security_group_id = azurerm_network_security_group.nsg-lab.name
}