## ..:: Create Virtual Networks (Azure vnet) ::..
## ----------------------------------------------------------------------------

resource "azurerm_virtual_network" "vnet" {

  count               = var.how_many_vnets

  name                = "${var.prefix_name}-${var.vnet_configurations[count.index].vnet_name}-vnet"
  resource_group_name = var.rg_name
  location            = var.vnet_location
  address_space       = var.vnet_configurations[count.index].address_space

  tags = {
    owner             = var.vnet_owner
  }  
}


## ..:: Creating Subnet in Azure Virtual Networks ::..
## ----------------------------------------------------------------------------

resource "azurerm_subnet" "vnet_subnet" {

  depends_on             = [azurerm_virtual_network.vnet]
  count                  = var.how_many_subnets

  name                   = var.subnet_configurations[count.index].subnet_name
  resource_group_name    = var.rg_name
  virtual_network_name   = "${var.prefix_name}-${var.subnet_configurations[count.index].vnet_name}-vnet"
  address_prefix         = var.subnet_configurations[count.index].address_prefix 
  
}

#output "vnet_id" {
#  value = azurerm_virtual_network.vnet.id
#}