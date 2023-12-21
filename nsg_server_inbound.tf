## Inbound Rules ##

# Port 53 DNS TCP
resource "azurerm_network_security_rule" "tcp_53_dc_inbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-dc-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_53_DNS_TCP-DC${count.index+1}_Inbound"
  description                 = "AD_53_DNS_TCP-DC${count.index+1}_Inbound"
  priority                    = (100 + count.index)
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "53"
  source_address_prefix       = local.dns_servers[count.index]
  destination_address_prefix  = "*"
}

# Port 53 DNS UDP
resource "azurerm_network_security_rule" "udp_53_dc_inbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-dc-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_53_DNS_UDP-DC${count.index+1}_Inbound"
  description                 = "AD_53_DNS_UDP-DC${count.index+1}_Inbound"
  priority                    = (110 + count.index)
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range      = "53"
  source_address_prefix       = local.dns_servers[count.index]
  destination_address_prefix  = "*"
}

# Port 88 Kerberos TCP
resource "azurerm_network_security_rule" "tcp_88_dc_inbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-dc-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_88_Kerberos_TCP-DC${count.index+1}_Inbound"
  description                 = "AD_88_Kerberos_TCP-DC${count.index+1}_Inbound"
  priority                    = (120 + count.index)
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "88"
  source_address_prefix       = local.dns_servers[count.index]
  destination_address_prefix  = "*"
}

# Port 88 Kerberos UDP
resource "azurerm_network_security_rule" "udp_88_dc_inbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-dc-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_88_Kerberos_UDP-DC${count.index+1}_Inbound"
  description                 = "AD_88_Kerberos_UDP-DC${count.index+1}_Inbound"
  priority                    = (130 + count.index)
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range      = "88"
  source_address_prefix       = local.dns_servers[count.index]
  destination_address_prefix  = "*"
}

# Port 123 W32Time UDP
resource "azurerm_network_security_rule" "udp_123_dc_inbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-dc-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_123_W32Time_UDP-DC${count.index+1}_Inbound"
  description                 = "AD_123_W32Time_UDP-DC${count.index+1}_Inbound"
  priority                    = (140 + count.index)
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range      = "123"
  source_address_prefix       = local.dns_servers[count.index]
  destination_address_prefix  = "*"
}

# Port 135 RPC TCP
resource "azurerm_network_security_rule" "tcp_135_dc_inbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-dc-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_135_RPC_TCP-DC${count.index+1}_Inbound"
  description                 = "AD_135_RPC_TCP-DC${count.index+1}_Inbound"
  priority                    = (150 + count.index)
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "135"
  source_address_prefix       = local.dns_servers[count.index]
  destination_address_prefix  = "*"
}

# Port 137-138 NetLogon UDP
resource "azurerm_network_security_rule" "udp_137-138_dc_inbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-dc-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_137-138_NetLogon_UDP-DC${count.index+1}_Inbound"
  description                 = "AD_137-138_NetLogon_UDP-DC${count.index+1}_Inbound"
  priority                    = (160 + count.index)
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range      = "137-138"
  source_address_prefix       = local.dns_servers[count.index]
  destination_address_prefix  = "*"
}

# Port 139 NetLogon TCP
resource "azurerm_network_security_rule" "tcp_139_dc_inbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-dc-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_139_NetLogon_TCP-DC${count.index+1}_Inbound"
  description                 = "AD_139_NetLogon_TCP-DC${count.index+1}_Inbound"
  priority                    = (170 + count.index)
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range      = "139"
  source_address_prefix       = local.dns_servers[count.index]
  destination_address_prefix  = "*"
}

# Port 389 LDAP TCP
resource "azurerm_network_security_rule" "tcp_389_dc_inbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-dc-nsg.name
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

# Port 389 LDAP UDP
resource "azurerm_network_security_rule" "udp_389_dc_inbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-dc-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_389_LDAP_UDP-DC${count.index+1}_Inbound"
  description                 = "AD_389_LDAP_UDP-DC${count.index+1}_Inbound"
  priority                    = (190 + count.index)
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range      = "389"
  source_address_prefix       = local.dns_servers[count.index]
  destination_address_prefix  = "*"
}

# Port 445 SMB TCP
resource "azurerm_network_security_rule" "tcp_445_dc_inbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-dc-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_445_SMB_TCP-DC${count.index+1}_Inbound"
  description                 = "AD_445_SMB_TCP-DC${count.index+1}_Inbound"
  priority                    = (200 + count.index)
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "445"
  source_address_prefix       = local.dns_servers[count.index]
  destination_address_prefix  = "*"
}

# Port 464 Kerberos Authentication TCP
resource "azurerm_network_security_rule" "tcp_464_dc_inbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-dc-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_464_Kerberos_Authentication_TCP-DC${count.index+1}_Inbound"
  description                 = "AD_464_Kerberos_Authentication_TCP-DC${count.index+1}_Inbound"
  priority                    = (210 + count.index)
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "464"
  source_address_prefix       = local.dns_servers[count.index]
  destination_address_prefix  = "*"
}

# Port 464 Kerberos Authentication UDP
resource "azurerm_network_security_rule" "udp_464_dc_inbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-dc-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_464_Kerberos_Authentication_UDP-DC${count.index+1}_Inbound"
  description                 = "AD_464_Kerberos_Authentication_UDP-DC${count.index+1}_Inbound"
  priority                    = (220 + count.index)
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range      = "464"
  source_address_prefix       = local.dns_servers[count.index]
  destination_address_prefix  = "*"
}

# Port 636 LDAP SSL TCP
resource "azurerm_network_security_rule" "tcp_636_dc_inbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-dc-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_636_LDAP_SSL_TCP-DC${count.index+1}_Inbound"
  description                 = "AD_636_LDAP_SSL_TCP-DC${count.index+1}_Inbound"
  priority                    = (230 + count.index)
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "636"
  source_address_prefix       = local.dns_servers[count.index]
  destination_address_prefix  = "*"
}

# Port 3268-3269 LDAP GC TCP
resource "azurerm_network_security_rule" "tcp_3268-3269_dc_inbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-dc-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_3268-3269_LDAP_GC_TCP-DC${count.index+1}_Inbound"
  description                 = "AD_3268-3269_LDAP_GC_TCP-DC${count.index+1}_Inbound"
  priority                    = (240 + count.index)
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3268-3269"
  source_address_prefix       = local.dns_servers[count.index]
  destination_address_prefix  = "*"
}

# Port 49152-65535 TCP
resource "azurerm_network_security_rule" "tcp_49152-65535_dc_inbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-dc-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_49152-65535_TCP-DC${count.index+1}Inbound"
  description                 = "AD_49152-65535_TCP-DC${count.index+1}_Inbound"
  priority                    = (250 + count.index)
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "49152-65535"
  source_address_prefix       = local.dns_servers[count.index]
  destination_address_prefix  = "*"
}

# Port 49152-65535 UDP
resource "azurerm_network_security_rule" "udp_49152-65535_dc_inbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-dc-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_49152-65535_UDP-DC${count.index+1}_Inbound"
  description                 = "AD_49152-65535_UDP-DC${count.index+1}_Inbound"
  priority                    = (260 + count.index)
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range      = "49152-65535"
  source_address_prefix       = local.dns_servers[count.index]
  destination_address_prefix  = "*"
}

# Allow ping AD Domain Controllers
resource "azurerm_network_security_rule" "icmp_dc_inbound" {
  depends_on = [azurerm_resource_group.rg]

  count = length(local.dns_servers)

  network_security_group_name = azurerm_network_security_group.active-directory-dc-nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
  name                        = "AD_Ping_to_DC${count.index+1}_Inbound"
  description                 = "AD_Ping_to_DC${count.index+1}_Inbound"
  priority                    = (270 + count.index)
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Icmp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = local.dns_servers[count.index]
  destination_address_prefix  = "*"
}