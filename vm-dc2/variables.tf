#Name of DC VM
variable "vmname" {
  type    = string
}

variable "envname" {
  type    = string
}

#Location for DC resources
variable "location" {
  type    = string
}

#Size of DC VM
variable "size" {
  type    = string
  default = "Standard_DS1_v2"
}

#Resource Group for DC resources
variable "azurerm_resource_group" {
  type    = object({
    name = string
    location = string
    })
}

#Subnet for DC
variable "azurerm_subnet" {
  type    = object({
    id = string
    })
}

# domain controller private ip address
variable "ipaddress" {
  type        = string
  description = "This variable defines the private ip address of AD Domain Controller 1"
}

# domain controller
variable "dnsservers" {
  type        = any
  description = "This variable holds the IP's of both DC's"
}

# domain controller private ip address
variable "availability_set_id" {
  type        = string
  description = "This variable defines the private ip address of AD Domain Controller 1"
}

#Domain Variables
# active directory domain name
variable "ad_domain_name" {
  type        = string
  description = "This variable defines the name of Active Directory domain, for example badmin.co.uk"
}

# active directory domain NetBIOS name
variable "ad_domain_netbios_name" {
  type        = string
  description = "This variable defines the NETBIOS name of Active Directory domain, for example BADMIN"
}

# active directory domain mode
variable "ad_domain_mode" {
  type        = string
  description = "This variable defines the mode of Active Directory domain and forest functional level"
  default     = "WinThreshold" # Windows Server 2016
}

# local administrator username
variable "ad_admin_username" {
  type        = string
  description = "The username associated with the local administrator account on the virtual machine"
}

# local administrator password
variable "ad_admin_password" {
  type        = string
  description = "The password associated with the local administrator account on the virtual machine"
}

# active directory database path
variable "ad_database_path" {
  type        = string
  description = "The active directory database path"
  default     = "C:/Windows/NTDS"
}

# active directory sysvol path
variable "ad_sysvol_path" {
  type        = string
  description = "The active directory SYSVOL path"
  default     = "C:/Windows/SYSVOL"
}

# active directory log path
variable "ad_log_path" {
  type        = string
  description = "The active directory log path"
  default     = "C:/Windows/NTDS"
}

# active directory safe mode administrator password
variable "ad_safe_mode_administrator_password" {
  type        = string
  description = "The active directory safe mode administrator password"
}