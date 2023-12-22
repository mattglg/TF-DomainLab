[CmdletBinding()]

param 
( 
    [Parameter(ValuefromPipeline=$true,Mandatory=$true)] [string]$ad_domain_name,
    [Parameter(ValuefromPipeline=$true,Mandatory=$true)] [string]$ad_domain_netbios_name,
    [Parameter(ValuefromPipeline=$true,Mandatory=$true)] [string]$ad_admin_password,
    [Parameter(ValuefromPipeline=$true,Mandatory=$true)] [string]$ad_admin_username,
    [Parameter(ValuefromPipeline=$true,Mandatory=$true)] [string]$ad_database_path,
    [Parameter(ValuefromPipeline=$true,Mandatory=$true)] [string]$ad_log_path,
    [Parameter(ValuefromPipeline=$true,Mandatory=$true)] [string]$ad_sysvol_path,
    [Parameter(ValuefromPipeline=$true,Mandatory=$true)] [String]$ad_safe_mode_administrator_password
)

$SMAP = ConvertTo-SecureString -AsPlainText $ad_safe_mode_administrator_password -Force

$User = "$ad_admin_username@$ad_domain_name"
$secStringPassword = ConvertTo-SecureString $ad_admin_password -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $user, $secStringPassword

Install-WindowsFeature -name AD-Domain-Services -IncludeManagementTools
#Install-WindowsFeature DNS -IncludeAllSubFeature -IncludeManagementTools

Install-ADDSDomainController -DomainName $ad_domain_name -Credential $Credential -CreateDnsDelegation:$false -DatabasePath $ad_database_path -SysvolPath $ad_sysvol_path -LogPath $ad_log_path -Force:$true -SkipPreChecks -SafeModeAdministratorPassword $SMAP -NoRebootOnCompletion:$false -InstallDns:$true
Set-DnsServerForwarder -IPAddress "8.8.8.8", "1.1.1.1"
exit 0