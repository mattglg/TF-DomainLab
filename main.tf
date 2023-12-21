# Create a resource group for the VM
resource "azurerm_resource_group" "rg" {
  location = var.location
  name     = "${var.envname}-rg"
}

resource "azurerm_availability_set" "dc-availability-set" {
  name                         = "${var.envname}-dc-avail"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  platform_fault_domain_count  = 3
  platform_update_domain_count = 5
  managed                      = true
}

#Create VM for DC1
module "dc1" {
    source = "./vm-dc"
    azurerm_resource_group = azurerm_resource_group.rg
    vmname = ad_dc1_name
    azurerm_subnet = data.azurerm_subnet.snet
    ipaddress = ad_dc1_ip_address
    dnsservers = local.dns_servers
    availability_set_id = azurerm_availability_set.dc-availability-set.id
}

/*
module "vm1" {
    source = "./vm2022"
    azurerm_resource_group = azurerm_resource_group.rg
    vmname = "vm1"
    azurerm_subnet = data.azurerm_subnet.snet
}
*/