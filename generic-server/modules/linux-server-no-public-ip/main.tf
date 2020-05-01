## ..:: Loading files ::..
## ----------------------------------------------------------------------------
data "local_file" "ssh_key" {
  filename = var.ssh_key
}

data "template_file" "init_file" {

  count = var.how_many_servers

  template = "${file("${path.module}/scripts/${var.linuxvm_script_names[count.index]}.tpl")}"

}

## ..:: Loading Network and Subnets ::..
## ============================================================================
data "azurerm_subnet" "vnet_subnet" {

  name                 = var.subnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = "${var.prefix_name}-${var.vnet_name}-vnet"

}

## ..:: Loading Network Security Group ::..
## ============================================================================
data "azurerm_network_security_group" "nsg" {

  name                 = "${var.prefix_name}-${var.nsg_name}-nsg"
  resource_group_name  = var.rg_name
}

resource "azurerm_network_interface" "linuxvm_subnet_vnic" {

  count = var.how_many_servers

  name                       = "${var.prefix_name}-${var.vnet_name}-${var.linuxvm_hostname[count.index]}-${var.subnet_name}-vnic"
  location                   = var.location_name
  resource_group_name        = var.rg_name
  #network_security_group_id  = data.azurerm_network_security_group.nsg.id

  ip_configuration {
    name                          = "${var.prefix_name}-${var.vnet_name}-${var.linuxvm_hostname[count.index]}-ip-config"
    subnet_id                     = data.azurerm_subnet.vnet_subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.linuxvm_subnet_ip[count.index]
  }

  tags = {
    owner = var.owner_name
  }
}

resource "azurerm_network_interface_security_group_association" "nsg_in_vnic" {

  count = var.how_many_servers

  network_interface_id      = azurerm_network_interface.linuxvm_subnet_vnic[count.index].id
  network_security_group_id = data.azurerm_network_security_group.nsg.id
}


resource "azurerm_virtual_machine" "linuxvm_vm" {

  count = var.how_many_servers

  name                         = "${var.prefix_name}-${var.vnet_name}-${var.linuxvm_hostname[count.index]}-vm"
  location                     = var.location_name
  resource_group_name          = var.rg_name
  primary_network_interface_id = azurerm_network_interface.linuxvm_subnet_vnic[count.index].id
  network_interface_ids        = [azurerm_network_interface.linuxvm_subnet_vnic[count.index].id]
  vm_size                      = var.linuxvm_size[count.index]

  storage_os_disk {
    name              = "${var.prefix_name}-${var.vnet_name}-${var.linuxvm_hostname[count.index]}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  storage_image_reference {
    publisher = var.publisher[count.index]
    offer     = var.offer[count.index]
    sku       = var.sku[count.index]
    version   = var.disti_version[count.index]
  }

  os_profile {
    computer_name  = var.linuxvm_hostname[count.index]
    admin_username = var.linuxvm_admin_username[count.index]
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      path     = var.ssh_public_key_path[count.index]
      key_data = data.local_file.ssh_key.content
    }
  }

  tags = {
    owner = var.owner_name
  }
}

## ..:: Run Startup Script ::..
resource "azurerm_virtual_machine_extension" "vmext" {

  count = var.how_many_servers

  name                 = "${var.prefix_name}-${var.vnet_name}-${var.linuxvm_hostname[count.index]}-vmext"
  depends_on           = [azurerm_virtual_machine.linuxvm_vm]
  virtual_machine_id   = azurerm_virtual_machine.linuxvm_vm[count.index].id

  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  protected_settings = <<PROT
  {
    "script": "${base64encode(data.template_file.init_file[count.index].rendered)}"
  }
  PROT
}
