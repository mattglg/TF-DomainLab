## Outbound Rules ##

# Port 53 DNS TCP
resource "azurerm_network_security_rule" "tcp_53_dc_outbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-dc-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_53_DNS_TCP-DC${count.index+1}_Outbound"
  description                 = "AD_53_DNS_TCP-DC${count.index+1}_Outbound"
  priority                    = (100 + count.index)
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "53"
  source_address_prefix       = "*"
  destination_address_prefix  = local.dns_servers[count.index]
}

# Port 53 DNS UDP
resource "azurerm_network_security_rule" "udp_53_dc_outbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-dc-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_53_DNS_UDP-DC${count.index+1}_Outbound"
  description                 = "AD_53_DNS_UDP-DC${count.index+1}_Outbound"
  priority                    = (110 + count.index)
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range      = "53"
  source_address_prefix       = "*"
  destination_address_prefix  = local.dns_servers[count.index]
}

# Port 88 Kerberos TCP
resource "azurerm_network_security_rule" "tcp_88_dc_outbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-dc-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_88_Kerberos_TCP-DC${count.index+1}_Outbound"
  description                 = "AD_88_Kerberos_TCP-DC${count.index+1}_Outbound"
  priority                    = (120 + count.index)
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "88"
  source_address_prefix       = "*"
  destination_address_prefix  = local.dns_servers[count.index]
}

# Port 88 Kerberos UDP
resource "azurerm_network_security_rule" "udp_88_dc_outbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-dc-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_88_Kerberos_UDP-DC${count.index+1}_Outbound"
  description                 = "AD_88_Kerberos_UDP-DC${count.index+1}_Outbound"
  priority                    = (130 + count.index)
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range      = "88"
  source_address_prefix       = "*"
  destination_address_prefix  = local.dns_servers[count.index]
}

# Port 123 W32Time UDP
resource "azurerm_network_security_rule" "udp_123_dc_outbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-dc-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_123_W32Time_UDP-DC${count.index+1}_Outbound"
  description                 = "AD_123_W32Time_UDP-DC${count.index+1}_Outbound"
  priority                    = (140 + count.index)
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range      = "123"
  source_address_prefix       = "*"
  destination_address_prefix  = local.dns_servers[count.index]
}

# Port 135 RPC TCP
resource "azurerm_network_security_rule" "tcp_135_dc_outbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-dc-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_135_RPC_TCP-DC${count.index+1}_Outbound"
  description                 = "AD_135_RPC_TCP-DC${count.index+1}_Outbound"
  priority                    = (150 + count.index)
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "135"
  source_address_prefix       = "*"
  destination_address_prefix  = local.dns_servers[count.index]
}

# Port 137-138 NetLogon UDP
resource "azurerm_network_security_rule" "udp_137-138_dc_outbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-dc-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_137-138_NetLogon_UDP-DC${count.index+1}_Outbound"
  description                 = "AD_137-138_NetLogon_UDP-DC${count.index+1}_Outbound"
  priority                    = (160 + count.index)
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range      = "137-138"
  source_address_prefix       = "*"
  destination_address_prefix  = local.dns_servers[count.index]
}

# Port 139 NetLogon TCP
resource "azurerm_network_security_rule" "tcp_139_dc_outbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-dc-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_139_NetLogon_TCP-DC${count.index+1}_Outbound"
  description                 = "AD_139_NetLogon_TCP-DC${count.index+1}_Outbound"
  priority                    = (170 + count.index)
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range      = "139"
  source_address_prefix       = "*"
  destination_address_prefix  = local.dns_servers[count.index]
}

# Port 389 LDAP TCP
resource "azurerm_network_security_rule" "tcp_389_dc_outbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-dc-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_389_LDAP_TCP-DC${count.index+1}_Outbound"
  description                 = "AD_389_LDAP_TCP-DC${count.index+1}_Outbound"
  priority                    = (180 + count.index)
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "389"
  source_address_prefix       = "*"
  destination_address_prefix  = local.dns_servers[count.index]
}

# Port 389 LDAP UDP
resource "azurerm_network_security_rule" "udp_389_dc_outbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-dc-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_389_LDAP_UDP-DC${count.index+1}_Outbound"
  description                 = "AD_389_LDAP_UDP-DC${count.index+1}_Outbound"
  priority                    = (190 + count.index)
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range      = "389"
  source_address_prefix       = "*"
  destination_address_prefix  = local.dns_servers[count.index]
}

# Port 445 SMB TCP
resource "azurerm_network_security_rule" "tcp_445_dc_outbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-dc-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_445_SMB_TCP-DC${count.index+1}_Outbound"
  description                 = "AD_445_SMB_TCP-DC${count.index+1}_Outbound"
  priority                    = (200 + count.index)
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "445"
  source_address_prefix       = "*"
  destination_address_prefix  = local.dns_servers[count.index]
}

# Port 464 Kerberos Authentication TCP
resource "azurerm_network_security_rule" "tcp_464_dc_outbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-dc-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_464_Kerberos_Authentication_TCP-DC${count.index+1}_Outbound"
  description                 = "AD_464_Kerberos_Authentication_TCP-DC${count.index+1}_Outbound"
  priority                    = (210 + count.index)
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "464"
  source_address_prefix       = "*"
  destination_address_prefix  = local.dns_servers[count.index]
}

# Port 464 Kerberos Authentication UDP
resource "azurerm_network_security_rule" "udp_464_dc_outbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-dc-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_464_Kerberos_Authentication_UDP-DC${count.index+1}_Outbound"
  description                 = "AD_464_Kerberos_Authentication_UDP-DC${count.index+1}_Outbound"
  priority                    = (220 + count.index)
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range      = "464"
  source_address_prefix       = "*"
  destination_address_prefix  = local.dns_servers[count.index]
}

# Port 636 LDAP SSL TCP
resource "azurerm_network_security_rule" "tcp_636_dc_outbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-dc-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_636_LDAP_SSL_TCP-DC${count.index+1}_Outbound"
  description                 = "AD_636_LDAP_SSL_TCP-DC${count.index+1}_Outbound"
  priority                    = (230 + count.index)
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "636"
  source_address_prefix       = "*"
  destination_address_prefix  = local.dns_servers[count.index]
}