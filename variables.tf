variable "envname" {
  type    = string
  default = "testenv1"
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

locals {
  dns_servers = [ var.ad_dc1_ip_address, var.ad_dc2_ip_address ]
  dc_servers = [ var.ad_dc1_ip_address, var.ad_dc2_ip_address ]
}