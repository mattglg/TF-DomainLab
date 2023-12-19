# Read in the subnet for the VM
data "azurerm_subnet" "snet" {
  name                 = "subnet1"
  virtual_network_name = "vnet1"
  resource_group_name  = "rg-iac-network"
}