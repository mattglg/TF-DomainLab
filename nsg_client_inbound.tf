## Inbound Rules ##

# Port 53 DNS UDP
resource "azurerm_network_security_rule" "udp_53_client_inbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-client-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_53_DNS_UDP-DC${count.index+1}_Inbound"
  description                 = "AD_53_DNS_UDP-DC${count.index+1}_Inbound"
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

  network_security_group_name = azurerm_network_security_group.active-directory-client-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_88_Kerberos_TCP-DC${count.index+1}_Inbound"
  description                 = "AD_88_Kerberos_TCP-DC${count.index+1}_Inbound"
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

  network_security_group_name = azurerm_network_security_group.active-directory-client-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_135_RPC_TCP-DC${count.index+1}_Inbound"
  description                 = "AD_135_RPC_TCP-DC${count.index+1}_Inbound"
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

  network_security_group_name = azurerm_network_security_group.active-directory-client-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_389_LDAP_TCP-DC${count.index+1}_Inbound"
  description                 = "AD_389_LDAP_TCP-DC${count.index+1}_Inbound"
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

  network_security_group_name = azurerm_network_security_group.active-directory-client-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_445_SMB_TCP-DC${count.index+1}_Inbound"
  description                 = "AD_445_SMB_TCP-DC${count.index+1}_Inbound"
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

  network_security_group_name = azurerm_network_security_group.active-directory-client-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_49152-65535_TCP-DC${count.index+1}_Inbound"
  description                 = "AD_49152-65535_TCP-DC${count.index+1}_Inbound"
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

  network_security_group_name = azurerm_network_security_group.active-directory-client-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_49152-65535_UDP-DC${count.index+1}_Inbound"
  description                 = "AD_49152-65535_UDP-DC${count.index+1}_Inbound"
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

  network_security_group_name = azurerm_network_security_group.active-directory-client-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_Ping_to_DC${count.index+1}_Inbound"
  description                 = "AD_Ping_to_DC${count.index+1}_Inbound"
  priority                    = (220 + count.index)
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Icmp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = local.dns_servers[count.index]
  destination_address_prefix  = "*"
}

# Port 3389 RDP TCP/UDP
resource "azurerm_network_security_rule" "rdp_3389_client_inbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-client-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_3389_RDP-DC${count.index+1}_Inbound"
  description                 = "AD_3389_RDP-DC${count.index+1}_Inbound"
  priority                    = (230 + count.index)
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = local.dns_servers[count.index]
  destination_address_prefix  = "*"
}

