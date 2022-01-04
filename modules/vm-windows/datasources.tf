data "azurerm_key_vault" "keyvault" {
  #resource_group_name = var.rg_name
  resource_group_name  = "${data.azurerm_resource_group.rg_all.name}" 
  name = "keyvault-${var.project_name}-${var.environment}"
}