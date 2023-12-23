# https://techcommunity.microsoft.com/t5/itops-talk-blog/how-to-run-powershell-scripts-on-azure-vms-with-terraform/ba-p/3827573

#Domain Join
resource "azurerm_virtual_machine_extension" "domjoin" {

name = "domjoin"
virtual_machine_id = azurerm_windows_virtual_machine.vm.id
publisher = "Microsoft.Compute"
type = "JsonADDomainExtension"
type_handler_version = "1.3"
# What the settings mean: https://docs.microsoft.com/en-us/windows/desktop/api/lmjoin/nf-lmjoin-netjoindomain
settings = <<SETTINGS
{
"Name": "${var.ad_domain_name}",
"User": "${var.ad_domain_name}\\${var.ad_admin_username}",
"Restart": "true",
"Options": "3"
}
SETTINGS
protected_settings = <<PROTECTED_SETTINGS
{
"Password": "${var.ad_admin_password}"
}
PROTECTED_SETTINGS
}

#Variable input for the server_setup.ps1 script
data "template_file" "server_setup" {
    template = "${file("./vm-member-server/server_setup.ps1")}"
    vars = {

  }
}

#Run Server Setup Script
resource "azurerm_virtual_machine_extension" "server_setup" {
  depends_on           = [azurerm_virtual_machine_extension.domjoin]
  name                 = "server_setup"
  virtual_machine_id   = azurerm_windows_virtual_machine.vm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

  protected_settings = <<SETTINGS
  {    
    "commandToExecute": "powershell -command \"[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('${base64encode(data.template_file.server_setup.rendered)}')) | Out-File -filepath server_setup.ps1\" && powershell -ExecutionPolicy Unrestricted -File server_setup.ps1"
  }
  SETTINGS
}
