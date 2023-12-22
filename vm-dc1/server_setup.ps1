[CmdletBinding()]

param 
( 
    [Parameter(ValuefromPipeline=$true,Mandatory=$true)] [string]$ad_domain_name,
    [Parameter(ValuefromPipeline=$true,Mandatory=$true)] [string]$ad_domain_netbios_name,
    [Parameter(ValuefromPipeline=$true,Mandatory=$true)] [string]$ad_domain_mode,
    [Parameter(ValuefromPipeline=$true,Mandatory=$true)] [string]$ad_database_path,
    [Parameter(ValuefromPipeline=$true,Mandatory=$true)] [string]$ad_log_path,
    [Parameter(ValuefromPipeline=$true,Mandatory=$true)] [string]$ad_sysvol_path,
    [Parameter(ValuefromPipeline=$true,Mandatory=$true)] [String]$ad_safe_mode_administrator_password
)

$SMAP = ConvertTo-SecureString -AsPlainText $ad_safe_mode_administrator_password -Force

Set-NetFirewallProfile -Profile Domain, Public, Private -Enabled False

Install-WindowsFeature -name AD-Domain-Services -IncludeManagementTools
Install-WindowsFeature DNS -IncludeAllSubFeature -IncludeManagementTools
Set-DnsServerForwarder -IPAddress "8.8.8.8", "1.1.1.1"
Install-ADDSForest -DomainMode $ad_domain_mode -ForestMode $ad_domain_mode -CreateDnsDelegation:$false -DatabasePath $ad_database_path -DomainName $ad_domain_name -DomainNetbiosName $ad_domain_netbios_name -LogPath $ad_log_path -SysvolPath $ad_sysvol_path -Force:$true -SkipPreChecks -SafeModeAdministratorPassword $SMAP -NoRebootOnCompletion:$false
exit 0