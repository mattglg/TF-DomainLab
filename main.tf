# Create a resource group fot the VM
resource "azurerm_resource_group" "rg" {
  location = var.location
  name     = "${var.envname}-rg"
}

module "vm1" {
    source = "./vm2022"
    azurerm_resource_group = azurerm_resource_group.rg
    vmname = "vm1"
    azurerm_subnet = data.azurerm_subnet.snet
}

module "vm2" {
    source = "./vm2022"
    azurerm_resource_group = azurerm_resource_group.rg
    vmname = "vm2"
    azurerm_subnet = data.azurerm_subnet.snet
}