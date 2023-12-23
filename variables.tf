# GENERAL VARIABLES #

variable "envname" {
  type    = string
}

variable "member_server_count" {
  type    = number
}

variable "location" {
  type    = string
}

variable "size" {
  type    = string
}

variable "vnet_address_space" {
  type        = string
  description = "This variable defines the address space of the vnet via CIDR"
}

variable "subnet_address_space" {
  type        = string
  description = "This variable defines the address space of the subnet via CIDR"
}

variable "keyvault_name" {
  type        = string
  description = "This variable defines the KeyVault holding the domain and server passwords"
}

variable "domain_password_secret_name" {
  type        = string
  description = "This variable defines the name of the secret holding the domain password"
}

# DOMAIN CONTROLLER 1 VARIABLES #

# domain controller 1 name
variable "ad_dc1_name" {
  type        = string
  description = "This variable defines the name of AD Domain Controller 1"
}

# domain controller 1 private ip address
variable "ad_dc1_ip_address" {
  type        = string
  description = "This variable defines the private ip address of AD Domain Controller 1"
}

# DOMAIN CONTROLLER 2 VARIABLES #

# domain controller 2name
variable "ad_dc2_name" {
  type        = string
  description = "This variable defines the name of AD Domain Controller 2"
}

# domain controller 2private ip address
variable "ad_dc2_ip_address" {
  type        = string
  description = "This variable defines the private IP address of AD Domain Controller 2"
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
}

# active directory domain NetBIOS name
variable "ad_domain_netbios_name" {
  type        = string
  description = "This variable defines the NETBIOS name of Active Directory domain, for example kopicloud"
}

# active directory domain mode
variable "ad_domain_mode" {
  type        = string
  description = "This variable defines the mode of Active Directory domain and forest functional level"
}

# local administrator username
variable "ad_admin_username" {
  type        = string
  description = "The username associated with the local administrator account on the virtual machine"
}

# active directory database path
variable "ad_database_path" {
  type        = string
  description = "The active directory database path"
}

# active directory sysvol path
variable "ad_sysvol_path" {
  type        = string
  description = "The active directory SYSVOL path"
}

# active directory log path
variable "ad_log_path" {
  type        = string
  description = "The active directory log path"
}