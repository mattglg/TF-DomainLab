# Create public IPs
resource "azurerm_public_ip" "pip" {
  name                = "${var.vmname}-pip"
  location            = var.azurerm_resource_group.location
  resource_group_name = var.azurerm_resource_group.name
  allocation_method   = "Dynamic"
}

# Create Network Security Group and rules
resource "azurerm_network_security_group" "nsg" {
  name                = "${var.vmname}-nsg"
  location            = var.azurerm_resource_group.location
  resource_group_name = var.azurerm_resource_group.name

  security_rule {
    name                       = "RDP"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Create network interface
resource "azurerm_network_interface" "nic" {
  name                = "${var.vmname}-nic"
  location            = var.azurerm_resource_group.location
  resource_group_name = var.azurerm_resource_group.name
  internal_dns_name_label = var.vmname
  dns_servers             = var.dnsservers

  ip_configuration {
    name                          = "${var.vmname}_nic_configuration"
    subnet_id                     = var.azurerm_subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.ipaddress
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "nsga" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}