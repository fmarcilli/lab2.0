
data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "keyvault" {
  name                       = "keyvault-${var.project_name}-${var.environment}"
  location                   = var.location
  resource_group_name        = var.rg_name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  soft_delete_retention_days = 7

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "create",
      "update",
      "get",
    ]

    secret_permissions = [
      "set",
      "get",
      "delete",
      "purge",
      "recover"
    ]
  }
}


resource "random_string" "vm_password" {
  length = 14
  min_upper = 2
  min_lower = 2
  min_numeric = 2
  min_special = 2
  
}

resource "azurerm_key_vault_secret" "vm_secret" {
  name         = "vm_secret"
  value        = "${random_string.vm_password.result}"
  vault_uri    = "${var.vault_uri}"
 # key_vault_id = azurerm_key_vault.keyvault.id
}