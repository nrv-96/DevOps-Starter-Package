resource "random_password" "windows_vm" {
  length           = 12
  special          = true
  upper            = true
  lower            = true
  numeric          = true
  override_special = "!#$%&*()-=+"
}

resource "azurerm_public_ip" "window_vm_publicip" {
  allocation_method   = "Static"
  name                = "window-vm-public-ip"
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group.name
  tags                = var.tags
}

resource "azurerm_network_interface" "windows_nic" {
  name                = "windows-nic"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = var.location
  tags                = var.tags
  ip_configuration {
    name                          = "public-ip"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.window_vm_publicip.id
  }
}

resource "azurerm_windows_virtual_machine" "windows_vm" {
  name                  = "windows-vm"
  resource_group_name   = azurerm_resource_group.resource_group.name
  tags                  = var.tags
  size                  = "Standard_D2as_v5" #Standard_D4d_v5,Standard_D4d_v4,D4_v4,Standard_E2s_v3
  admin_username        = var.admin_user
  admin_password        = random_password.windows_vm.result
  location              = var.location
  eviction_policy       = "Delete"
  priority              = "Spot"
  timezone              = "India Standard Time"
  network_interface_ids = [azurerm_network_interface.windows_nic.id, ]
  source_image_reference {
    offer     = "windows-11" #"WindowsServer"
    publisher = "MicrosoftWindowsDesktop" #"MicrosoftWindowsServer"
    sku       = "win11-21h2-pro"
    version   = "latest"
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}
