# https://techcommunity.microsoft.com/t5/itops-talk-blog/how-to-run-powershell-scripts-on-azure-vms-with-terraform/ba-p/3827573

#Variable input for the server_setup.ps1 script
data "template_file" "server_setup" {
    template = "${file("./vm-dc1/server_setup.ps1")}"
    vars = {
        ad_domain_name                        = "${var.ad_domain_name}"
        ad_domain_netbios_name                = "${var.ad_domain_netbios_name}"
        ad_domain_mode                        = "${var.ad_domain_mode}"
        ad_database_path                      = "${var.ad_database_path}"
        ad_log_path                           = "${var.ad_log_path}"
        ad_sysvol_path                        = "${var.ad_sysvol_path}"
        ad_safe_mode_administrator_password   = "${var.ad_safe_mode_administrator_password}"
  }
}

#Run Server Setup Script to Install Active Directory on the DC01 VM
resource "azurerm_virtual_machine_extension" "server_setup" {
  name                 = "server_setup"
  virtual_machine_id   = azurerm_windows_virtual_machine.vm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

  protected_settings = <<SETTINGS
  {    
    "commandToExecute": "powershell -command \"[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('${base64encode(data.template_file.server_setup.rendered)}')) | Out-File -filepath server_setup.ps1\" && powershell -ExecutionPolicy Unrestricted -File server_setup.ps1 -ad_domain_name ${data.template_file.server_setup.vars.ad_domain_name} -ad_domain_netbios_name ${data.template_file.server_setup.vars.ad_domain_netbios_name} -ad_domain_mode ${data.template_file.server_setup.vars.ad_domain_mode} -ad_database_path ${data.template_file.server_setup.vars.ad_database_path} -ad_log_path ${data.template_file.server_setup.vars.ad_log_path} -ad_sysvol_path ${data.template_file.server_setup.vars.ad_sysvol_path} -ad_safe_mode_administrator_password ${data.template_file.server_setup.vars.ad_safe_mode_administrator_password}"
  }
  SETTINGS
}

