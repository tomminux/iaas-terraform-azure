terraform {
  required_version = ">= 0.12"
}

module "vnets_peerings1" {
  
  source = "./modules/routing"

  how_many_peerings    = var.peering1_how_many_peerings

  prefix_name          = var.prefix
  rg_name              = "${var.prefix}-rg"
  origin_vnets         = var.peering1_origin_vnet_names
  remote_vnets         = var.peering1_remote_vnet_names
  allow_network_access = var.peering1_allow_network_access

}
