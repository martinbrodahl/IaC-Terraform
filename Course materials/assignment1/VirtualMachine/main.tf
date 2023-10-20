resource "azurerm_resource_group" "vm-rg" {
  name     = var.vm_rg_name
  location = var.vm_location

  tags = local.common_tags
}

resource "azurerm_public_ip" "vm-pip" {
  name = var.vm_pip_name
  resource_group_name = azurerm_resource_group.vm-rg.name
  location = azurerm_resource_group.vm-rg.location
  allocation_method = "Static"

  tags = local.common_tags
}

resource "azurerm_network_interface" "vm-nic" {
  name                = var.vm_nic_name
  location            = azurerm_resource_group.vm-rg.location
  resource_group_name = azurerm_resource_group.vm-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.output-001-subnet-id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.vm-pip.id
  }

  tags = local.common_tags
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = azurerm_resource_group.vm-rg.name
  location            = azurerm_resource_group.vm-rg.location
  size                = var.vm_size
  admin_username      = var.output-002-vmuser
  admin_password      = var.output-003-vmpass
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.vm-nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.vm_satype
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = var.vm_sku
    version   = "latest"
  }

  tags = local.common_tags
}