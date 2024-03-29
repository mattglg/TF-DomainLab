# Create a resource group for the VM
resource "azurerm_resource_group" "rg" {
  location = var.location
  name     = "${var.envname}-rg"
}

#Create a Virtual Network for the lab environment
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.envname}-vnet"
  address_space       = [var.vnet_address_space]
  dns_servers         = local.dns_servers
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

#Create a Subnet for the lab resources
resource "azurerm_subnet" "snet" {
  name                 = "${var.envname}-snet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_address_space]
}

# Create Network Security Group and rules
resource "azurerm_network_security_group" "nsg" {
  name                = "${var.envname}-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

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
  security_rule {
    name                       = "WebAccess"
    priority                   = 1010
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_ranges          = [80, 443]
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Associate the NSG with the subnet
resource "azurerm_subnet_network_security_group_association" "nsga" {
  subnet_id                 = azurerm_subnet.snet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

#Create an availability group fpr the domain contollers
resource "azurerm_availability_set" "dc-availability-set" {
  name                         = "${var.envname}-dc-avail"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
  managed                      = true
}

#Get passwords from KeyVault
module "ad_admin_password" {
  source        = "./kv-secret"
  keyvault_name = var.keyvault_name
  secret_name   = var.domain_password_secret_name
}

#Create and configure DC1
module "dc1" {
  source                              = "./vm-dc1"
  azurerm_resource_group              = azurerm_resource_group.rg
  location                            = azurerm_resource_group.rg.location
  vmname                              = var.ad_dc1_name
  envname                             = var.envname
  azurerm_subnet                      = azurerm_subnet.snet
  ipaddress                           = var.ad_dc1_ip_address
  dnsservers                          = local.dns_servers
  availability_set_id                 = azurerm_availability_set.dc-availability-set.id
  ad_admin_password                   = module.ad_admin_password.secret_value
  ad_admin_username                   = var.ad_admin_username
  ad_safe_mode_administrator_password = module.ad_admin_password.secret_value
  ad_domain_name                      = var.ad_domain_name
  ad_domain_netbios_name              = var.ad_domain_netbios_name
}

#Create and configure DC2
module "dc2" {
  depends_on                          = [module.dc1]
  source                              = "./vm-dc2"
  azurerm_resource_group              = azurerm_resource_group.rg
  location                            = azurerm_resource_group.rg.location
  vmname                              = var.ad_dc2_name
  envname                             = var.envname
  azurerm_subnet                      = azurerm_subnet.snet
  ipaddress                           = var.ad_dc2_ip_address
  dnsservers                          = local.dns_servers
  availability_set_id                 = azurerm_availability_set.dc-availability-set.id
  ad_admin_password                   = module.ad_admin_password.secret_value
  ad_admin_username                   = var.ad_admin_username
  ad_safe_mode_administrator_password = module.ad_admin_password.secret_value
  ad_domain_name                      = var.ad_domain_name
  ad_domain_netbios_name              = var.ad_domain_netbios_name
}

module "memberserver" {
  depends_on              = [module.dc2]
  count                   = var.member_server_count
  source                  = "./vm-member-server"
  vmname                  = "${format("server%02d", count.index + 1)}"
  envname                 = var.envname
  azurerm_resource_group  = azurerm_resource_group.rg
  location                = azurerm_resource_group.rg.location
  azurerm_subnet          = azurerm_subnet.snet
  ad_admin_password       = module.ad_admin_password.secret_value
  ad_admin_username       = var.ad_admin_username
  ad_domain_name          = var.ad_domain_name
}