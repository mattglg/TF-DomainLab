variable "vmname" {
  type    = string
  default = "vm1"
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
    resource_group_name = string
    })
}