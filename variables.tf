# GENERAL VARIABLES #

variable "envname" {
  type    = string
  default = "testenv1"
}

variable "member_server_count" {
  type    = number
  default = "1"
}

variable "location" {
  type    = string
  default = "UK South"
}

variable "size" {
  type    = string
  default = "Standard_DS1_v2"
}

variable "vnet_address_space" {
  type        = string
  description = "This variable defines the address space of the vnet via CIDR"
  default = "10.0.0.0/16"
}

variable "subnet_address_space" {
  type        = string
  description = "This variable defines the address space of the subnet via CIDR"
  default = "10.0.1.0/24"
}

# DOMAIN CONTROLLER 1 VARIABLES #

# domain controller 1 name
variable "ad_dc1_name" {
  type        = string
  description = "This variable defines the name of AD Domain Controller 1"
  default = "dc1"
}

# domain controller 1 private ip address
variable "ad_dc1_ip_address" {
  type        = string
  description = "This variable defines the private ip address of AD Domain Controller 1"
  default = "10.0.1.10"
}

# DOMAIN CONTROLLER 2 VARIABLES #

# domain controller 2name
variable "ad_dc2_name" {
  type        = string
  description = "This variable defines the name of AD Domain Controller 2"
  default = "dc2"
}

# domain controller 2private ip address
variable "ad_dc2_ip_address" {
  type        = string
  description = "This variable defines the private IP address of AD Domain Controller 2"
  default = "10.0.1.11"
}

# ACTIVE DIRECTORY CONFIGURATION #

locals {
  dns_servers = [ var.ad_dc1_ip_address, var.ad_dc2_ip_address ]
  dc_servers = [ var.ad_dc1_ip_address, var.ad_dc2_ip_address ]
}

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