# active directory domain name
variable "ad_domain_name" {
  type        = string
  description = "This variable defines the name of Active Directory domain, for example kopicloud.local"
  default = "badmin.co.uk"
}

# active directory domain NetBIOS name
variable "ad_domain_netbios_name" {
  type        = string
  description = "This variable defines the NETBIOS name of Active Directory domain, for example kopicloud"
  default = "BADMIN"
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
  default = "mattglg"
}

# local administrator password
variable "ad_admin_password" {
  type        = string
  description = "The password associated with the local administrator account on the virtual machine"
  default = "LabPass264786"
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
  default = "LabPass264786"
}