# Create public IPs
resource "azurerm_public_ip" "pip" {
  name                = "${var.vmname}-pip"
  location            = var.azurerm_resource_group.location
  resource_group_name = var.azurerm_resource_group.name
  allocation_method   = "Dynamic"
}

# Create network interface
resource "azurerm_network_interface" "nic" {
  name                = "${var.vmname}-nic"
  location            = var.azurerm_resource_group.location
  resource_group_name = var.azurerm_resource_group.name

  ip_configuration {
    name                          = "${var.vmname}_nic_configuration"
    subnet_id                     = var.azurerm_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}