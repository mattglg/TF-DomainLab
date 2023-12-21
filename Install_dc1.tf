# Local variables for DC1
locals {
  dc1_fqdn = "${var.ad_dc1_name}.${var.ad_domain_name}"
  
  dc1_prereq_ad_1 = "Import-Module ServerManager"
  dc1_prereq_ad_2 = "Install-WindowsFeature AD-Domain-Services -IncludeAllSubFeature -IncludeManagementTools"
  dc1_prereq_ad_3 = "Install-WindowsFeature DNS -IncludeAllSubFeature -IncludeManagementTools"
  dc1_prereq_ad_4 = "Import-Module ADDSDeployment"
  dc1_prereq_ad_5 = "Import-Module DnsServer"

  dc1_install_ad_1         = "Install-ADDSForest -DomainName ${var.ad_domain_name} -DomainNetbiosName ${var.ad_domain_netbios_name} -DomainMode ${var.ad_domain_mode} -ForestMode ${var.ad_domain_mode} "
  dc1_install_ad_2         = "-DatabasePath ${var.ad_database_path} -SysvolPath ${var.ad_sysvol_path} -LogPath ${var.ad_log_path} -NoRebootOnCompletion:$false -Force:$true "
  dc1_install_ad_3         = "-SafeModeAdministratorPassword (ConvertTo-SecureString ${var.ad_safe_mode_administrator_password} -AsPlainText -Force)"
  
  dc1_shutdown_command     = "shutdown -r -t 10"
  dc1_exit_code_hack       = "exit 0"
  dc1_powershell_command   = "${local.dc1_prereq_ad_1}; ${local.dc1_prereq_ad_2}; ${local.dc1_prereq_ad_3}; ${local.dc1_prereq_ad_4}; ${local.dc1_prereq_ad_5}; ${local.dc1_install_ad_1}${local.dc1_install_ad_2}${local.dc1_install_ad_3}; ${local.dc1_shutdown_command}; ${local.dc1_exit_code_hack}"
}

resource "azurerm_virtual_machine_extension" "dc1-vm-extension" {
  depends_on=[azurerm_windows_virtual_machine.dc1-vm]

  name                 = "${var.ad_dc1_name}-vm-active-directory"
  virtual_machine_id   = azurerm_windows_virtual_machine.dc1-vm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"  
  settings = <  {
    "commandToExecute": "powershell.exe -Command \"${local.dc1_powershell_command}\""
  }
  SETTINGS
}