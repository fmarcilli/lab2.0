resource "azurerm_virtual_machine" "vmlab" {
  name                  = "vmlabs01"
  location              = var.location
  resource_group_name   = var.rg_name
  #network_interface_ids = [azurerm_network_interface.vmlab.id]
  vm_size               = "Standard_DS1_v2"

   storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "dev"
  }
}