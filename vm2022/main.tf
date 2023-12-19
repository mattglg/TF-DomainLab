# Create virtual machine
resource "azurerm_windows_virtual_machine" "vm" {
  name                  = "${var.vmname}-vm"
  admin_username        = "mattglg"
  admin_password        = var.vmpassword
  location              = var.azurerm_resource_group.location
  resource_group_name   = var.azurerm_resource_group.name
  network_interface_ids = [azurerm_network_interface.nic.id]
  size                  = var.size

  os_disk {
    name                 = "${var.vmname}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }

  #boot_diagnostics {
  #  storage_account_uri = data.azurerm_storage_account.vmdiags-st.primary_blob_endpoint
  #}
}

# Create an auto shutdown schedule fot the VM
resource "azurerm_dev_test_global_vm_shutdown_schedule" "sds" {
  virtual_machine_id = azurerm_windows_virtual_machine.vm.id
  location           = var.azurerm_resource_group.location
  enabled            = true

  daily_recurrence_time = "2300"
  timezone              = "GMT Standard Time"

  notification_settings {
    enabled         = false
    #time_in_minutes = "60"
    #webhook_url     = "https://sample-webhook-url.example.com"
  }
}