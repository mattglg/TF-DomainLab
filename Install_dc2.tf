#Domain Join DC2
resource "azurerm_virtual_machine_extension" "domjoin" {
depends_on=[module.dc2]
name = "domjoin"
virtual_machine_id = module.dc2.id
publisher = "Microsoft.Compute"
type = "JsonADDomainExtension"
type_handler_version = "1.3"
# What the settings mean: https://docs.microsoft.com/en-us/windows/desktop/api/lmjoin/nf-lmjoin-netjoindomain
settings = <<SETTINGS
{
"Name": "pixelrobots.co.uk",
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

# Local variables for DC2
locals {
  dc2_fqdn = "${var.ad_dc2_name}.${var.ad_domain_name}"

  dc2_prereq_ad_1 = "Import-Module ServerManager"
  dc2_prereq_ad_2 = "Install-WindowsFeature AD-Domain-Services -IncludeAllSubFeature -IncludeManagementTools"
  dc2_prereq_ad_3 = "Install-WindowsFeature DNS -IncludeAllSubFeature -IncludeManagementTools"
  dc2_prereq_ad_4 = "Import-Module ADDSDeployment"
  dc2_prereq_ad_5 = "Import-Module DnsServer"

  dc2_credentials_1 = "$User = '${var.ad_admin_username}@${var.ad_domain_name}'"
  dc2_credentials_2 = "$PWord = ConvertTo-SecureString -String ${var.ad_admin_password} -AsPlainText -Force"
  dc2_credentials_3 = "$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, $PWord"

  dc2_install_ad_1 = "Install-ADDSDomainController -DomainName ${var.ad_domain_name} -Credential $Credential -InstallDns:$true -CreateDnsDelegation:$false "
  dc2_install_ad_2 = "-DatabasePath ${var.ad_database_path} -SysvolPath ${var.ad_sysvol_path} -LogPath ${var.ad_log_path} -NoRebootOnCompletion:$false -Force:$true "
  dc2_install_ad_3 = "-SafeModeAdministratorPassword (ConvertTo-SecureString ${var.ad_safe_mode_administrator_password} -AsPlainText -Force) -CriticalReplicationOnly"

  dc2_shutdown_command   = "shutdown -r -t 10"
  dc2_exit_code_hack     = "exit 0"
  dc2_powershell_command = "${local.dc2_prereq_ad_1}; ${local.dc2_prereq_ad_2}; ${local.dc2_prereq_ad_3}; ${local.dc2_prereq_ad_4}; ${local.dc2_prereq_ad_5}; ${local.dc2_credentials_1}; ${local.dc2_credentials_2}; ${local.dc2_credentials_3}; ${local.dc2_install_ad_1}${local.dc2_install_ad_2}${local.dc2_install_ad_3}; ${local.dc2_shutdown_command}; ${local.dc2_exit_code_hack}"
}

# DC1 virtual machine extension - Install and configure AD
resource "azurerm_virtual_machine_extension" "dc2-vm-extension" {
  depends_on=[azure.azurerm_virtual_machine_extension.domjoin]

  name                 = "${var.ad_dc2_name}-vm-active-directory"
  virtual_machine_id   = module.dc2.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"  
  settings = <<SETTINGS
  {
    "commandToExecute": "powershell.exe -Command \"${local.dc1_powershell_command}\""
  }
  SETTINGS
}