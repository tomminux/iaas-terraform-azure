## ..:: Loading Network and Subnets ::..
## ----------------------------------------------------------------------------

data "azurerm_virtual_network" "remote_vnets" {

  count                = var.how_many_peerings

  name                 = "${var.prefix_name}-${var.remote_vnets[count.index]}-vnet"
  resource_group_name  = var.rg_name

}

## ..:: Creating Peer to Peer Networking ::..
## ----------------------------------------------------------------------------

resource "azurerm_virtual_network_peering" "vnets_peerings" {

  count = var.how_many_peerings

  name                         = "${var.prefix_name}-${var.origin_vnets[count.index]}-to-${var.remote_vnets[count.index]}-peering"
  resource_group_name          = var.rg_name
  virtual_network_name         = "${var.prefix_name}-${var.origin_vnets[count.index]}-vnet"
  remote_virtual_network_id    = data.azurerm_virtual_network.remote_vnets[count.index].id
  allow_virtual_network_access = var.allow_network_access[count.index]
  
}
