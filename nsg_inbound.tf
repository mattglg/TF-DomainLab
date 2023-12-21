## Inbound Rules ##

# Port 53 DNS UDP
resource "azurerm_network_security_rule" "udp_53_client_inbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD 53 DNS UDP - DC${count.index+1} Inbound"
  description                 = "AD 53 DNS UDP - DC${count.index+1} Inbound"
  priority                    = (150 + count.index)
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range      = "53"
  source_address_prefix       = local.dns_servers[count.index]
  destination_address_prefix  = "*"
}

# Port 88 Kerberos TCP
resource "azurerm_network_security_rule" "tcp_88_client_inbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD 88 Kerberos TCP - DC${count.index+1} Inbound"
  description                 = "AD 88 Kerberos TCP - DC${count.index+1} Inbound"
  priority                    = (160 + count.index)
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "88"
  source_address_prefix       = local.dns_servers[count.index]
  destination_address_prefix  = "*"
}

# Port 135 RPC TCP
resource "azurerm_network_security_rule" "tcp_135_client_inbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD 135 RPC TCP - DC${count.index+1} Inbound"
  description                 = "AD 135 RPC TCP - DC${count.index+1} Inbound"
  priority                    = (170 + count.index)
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "135"
  source_address_prefix       = local.dns_servers[count.index]
  destination_address_prefix  = "*"
}

# Port 389 LDAP TCP
resource "azurerm_network_security_rule" "tcp_389_client_inbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD 389 LDAP TCP - DC${count.index+1} Inbound"
  description                 = "AD 389 LDAP TCP - DC${count.index+1} Inbound"
  priority                    = (180 + count.index)
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "389"
  source_address_prefix       = local.dns_servers[count.index]
  destination_address_prefix  = "*"
}

# Port 445 SMB TCP
resource "azurerm_network_security_rule" "tcp_445_client_inbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD 445 SMB TCP - DC${count.index+1} Inbound"
  description                 = "AD 445 SMB TCP - DC${count.index+1} Inbound"
  priority                    = (190 + count.index)
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "445"
  source_address_prefix       = local.dns_servers[count.index]
  destination_address_prefix  = "*"
}

# Port 49152-65535 TCP
resource "azurerm_network_security_rule" "tcp_49152-65535_client_inbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD 49152-65535 TCP - DC${count.index+1} Inbound"
  description                 = "AD 49152-65535 TCP - DC${count.index+1} Inbound"
  priority                    = (200 + count.index)
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "49152-65535"
  source_address_prefix       = local.dns_servers[count.index]
  destination_address_prefix  = "*"
}

# Port 49152-65535 UDP
resource "azurerm_network_security_rule" "udp_49152-65535_client_inbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD 49152-65535 UDP - DC${count.index+1} Inbound"
  description                 = "AD 49152-65535 UDP - DC${count.index+1} Inbound"
  priority                    = (210 + count.index)
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range      = "49152-65535"
  source_address_prefix       = local.dns_servers[count.index]
  destination_address_prefix  = "*"
}

# Allow ping AD Domain Controllers
resource "azurerm_network_security_rule" "icmp_client_inbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD Ping to DC${count.index+1} Inbound"
  description                 = "AD Ping to DC${count.index+1} Inbound"
  priority                    = (220 + count.index)
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Icmp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = local.dns_servers[count.index]
  destination_address_prefix  = "*"
}