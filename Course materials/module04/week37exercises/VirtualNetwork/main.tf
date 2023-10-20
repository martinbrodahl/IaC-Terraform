resource "azurerm_network_security_group" "nsg" {
  name                = "nsg-we-${var.base_name}"
  location            = var.location
  resource_group_name = var.rgname

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}