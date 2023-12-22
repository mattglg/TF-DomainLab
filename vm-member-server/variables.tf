variable "vmname" {
  type    = string
}

variable "location" {
  type    = string
}

variable "size" {
  type    = string
  default = "Standard_DS1_v2"
}

variable "azurerm_resource_group" {
  type    = object({
    name = string
    location = string
    })
}

variable "azurerm_subnet" {
  type    = object({
    id = string
    })
}

#Domain Variables
# active directory domain name
variable "ad_domain_name" {
  type        = string
  description = "This variable defines the name of Active Directory domain, for example badmin.co.uk"
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