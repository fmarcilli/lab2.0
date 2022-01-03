
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


# resource "azurerm_key_vault_secret" "kv_secret" {
#   name         = "secret-vm"
#   value        = "szechuan"
#   key_vault_id = azurerm_key_vault.keyvault.id
# }



# Create KeyVault ID
# resource "random_id" "kvname" {
#   byte_length = 5
#   prefix = "keyvault"
# }
# Keyvault Creation1
# data "azurerm_client_config" "current" {}
# resource "azurerm_key_vault" "kv1" {
#   name                        = random_id.kvname.hex
#   location                    = var.location
#   resource_group_name         = var.rg_name
#   enabled_for_disk_encryption = true
#   tenant_id                   = data.azurerm_client_config.current.tenant_id
#   soft_delete_retention_days  = 7
#   purge_protection_enabled    = false
#   sku_name = "standard"
#   access_policy {
#     tenant_id = data.azurerm_client_config.current.tenant_id
#     object_id = data.azurerm_client_config.current.object_id
#     key_permissions = [
#       "get",
#     ]
#     secret_permissions = [
#       "get", "backup", "delete", "list", "purge", "recover", "restore", "set",
#     ]
#     storage_permissions = [
#       "get",
#     ]
#   }
# }

# Create KeyVault VM password
# resource "random_password" "vmpassword" {
#   length = 20
#   special = true
# }
# Create Key Vault Secret
# resource "azurerm_key_vault_secret" "vmpassword" {
#   name         = "vmpassword"
#   value        = random_password.vmpassword.result
#   key_vault_id = azurerm_key_vault.kv1.id
#   depends_on = [ azurerm_key_vault.kv1 ]
# }