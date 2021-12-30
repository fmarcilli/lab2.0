output "vm_password_result" {
    value = "${azurerm_key_vault_secret.vm_secret.value}"
  
}