## ..:: Azure Routing (Peerings) Variables ::..
## ---------------------------------------------------------------------------

variable "peering1_how_many_peerings" {
  description = ""
  type        = number
}

variable "peering1_origin_vnet_names" {
  description = ""
  type        = list(string)
}

variable "peering1_remote_vnet_names" {
  description = ""
  type        = list(string)
}

variable "peering1_allow_network_access" {
  description = ""
  type        = list(bool)
}
