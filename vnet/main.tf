terraform {
  required_version = ">= 0.12"
}

module "create_vnets" {

  source                = "./modules/networking"

  prefix_name           = var.prefix
  rg_name               = "${var.prefix}-rg"
  vnet_location         = var.location_name
  vnet_owner            = var.owner_name
  
  how_many_vnets        = var.how_many_vnets
  how_many_subnets      = var.how_many_subnets
  vnet_configurations   = var.vnet_configurations
  subnet_configurations = var.subnet_configurations
}

/*
module "vnets_peerings1" {
  
  source = "./modules/routing"

  how_many_peerings    = var.peering1_how_many_peerings

  prefix_name          = var.prefix
  rg_name              = "${var.prefix}-rg"
  origin_vnets         = var.peering1_origin_vnet_names
  remote_vnets         = var.peering1_remote_vnet_names
  allow_network_access = var.peering1_allow_network_access
}
*/

module "default_nsg" {

  source = "./modules/security"

  rg_name                      = "${var.prefix}-rg"
  prefix_name                  = var.prefix
  location_name                = var.location_name
  owner_name                   = var.owner_name

  nsg_name                     = var.default_nsg_name
  security_rules_configuration = var.default_security_rules_configuration

}

module "ssg_nsg" {

  source = "./modules/security"

  rg_name                       = "${var.prefix}-rg"
  prefix_name                   = var.prefix
  location_name                 = var.location_name
  owner_name                    = var.owner_name

  nsg_name                      = var.ssh_nsg_name
  security_rules_configuration  = var.ssh_security_rules_configuration
  
}
