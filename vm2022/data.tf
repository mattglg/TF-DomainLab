# Read in virtual network for the VM
data "azurerm_virtual_network" "vnet" {
  name = "vnet1"
  resource_group_name = "rg-iac-network"
}

# Read in the subnet for the VM
data "azurerm_subnet" "snet" {
  name                 = "subnet1"
  virtual_network_name = "vnet1"
  resource_group_name  = "rg-iac-network"
}

# Read in the storage account to be used for VM boot diagnostics
#data "azurerm_storage_account" "vmdiags-st" {
#  name                = "vmdiagsst0337b73f"
#  resource_group_name = "rg-iac-network"
#}