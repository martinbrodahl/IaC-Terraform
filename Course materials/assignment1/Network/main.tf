resource "azurerm_resource_group" "vnet-rg" {
  name     = var.vnet_rg_name
  location = var.vnet_location

  tags = local.common_tags
}

resource "azurerm_network_security_group" "vnet-nsg" {
  name                = var.nsg_name
  location            = azurerm_resource_group.vnet-rg.location
  resource_group_name = azurerm_resource_group.vnet-rg.name
  
  security_rule {
    name                       = "Allow-Public-IP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = var.nsg_personal_pip
    destination_address_prefix = "*"
  }

  tags = local.common_tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.vnet-rg.location
  resource_group_name = azurerm_resource_group.vnet-rg.name

  tags = local.common_tags
}

resource "azurerm_subnet" "vnet-subnet" {
  name                 = var.vnet_subnet_name
  resource_group_name  = azurerm_resource_group.vnet-rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet_network_security_group_association" "vnet-subnet-nsg-a" {
  subnet_id                 = azurerm_subnet.vnet-subnet.id
  network_security_group_id = azurerm_network_security_group.vnet-nsg.id
}