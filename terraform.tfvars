# GENERAL VARIABLES #
envname                     = "Test1"                   # Used as a resource prefix
member_server_count         = 1                         # Required number of Member Servers
location                    = "UK South"                # Azure Location for resources
size                        = "Standard_DS1_v2"         # Size of VM's
vnet_address_space          = "10.0.0.0/16"             # Vnet Address Space
subnet_address_space        = "10.0.1.0/24"             # Subnet Address Space
keyvault_name               = "kv-terraform-mattglg"    # KeyVault name containing secrets
domain_password_secret_name = "domainadmin"             # KeyVault Secret Name for Admin Password

# DOMAIN CONTROLLER 1 VARIABLES #
ad_dc1_name                 = "dc1"                     # domain controller 1 name
ad_dc1_ip_address           = "10.0.1.10"               # domain controller 1 private ip address

# DOMAIN CONTROLLER 2 VARIABLES #
ad_dc2_name                 = "dc2"                     # domain controller 2name
ad_dc2_ip_address           = "10.0.1.11"               # domain controller 2private ip address

# ACTIVE DIRECTORY CONFIGURATION #
ad_domain_name              = "badmin.co.uk"            # active directory domain name
ad_domain_netbios_name      = "BADMIN"                  # active directory domain NetBIOS name
ad_domain_mode              = "WinThreshold"            # active directory domain mode 
ad_admin_username           = "mattglg"                 # administrator username
ad_database_path            = "C:/Windows/NTDS"         # active directory database path
ad_sysvol_path              = "C:/Windows/SYSVOL"       # active directory sysvol path
ad_log_path                 = "C:/Windows/NTDS"         # active directory log path