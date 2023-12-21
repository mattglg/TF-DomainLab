variable "vmname" {
  type    = string
}

variable "vmpassword" {
  type    = string
  default = "LabPass264786"
}

variable "location" {
  type    = string
  default = "UK South"
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

# domain controller 1 private ip address
variable "ipaddress" {
  type        = string
  description = "This variable defines the private ip address of AD Domain Controller 1"
}

# domain controller 1 private ip address
variable "dnsservers" {
  type        = any
  description = "This variable defines the private ip address of AD Domain Controller 1"
}

# domain controller 1 private ip address
variable "availability_set_id" {
  type        = string
  description = "This variable defines the private ip address of AD Domain Controller 1"
}