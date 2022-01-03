data "azurerm_key_vault" "keyvault" {
  resource_group_name = var.rg_name
  name = "keyvault-${var.project_name}-${var.environment}"
}