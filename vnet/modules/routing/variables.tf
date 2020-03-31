variable "rg_name" {
  description = ""
  type = string
}

variable "prefix_name" {
  description = ""
  type = string
}

variable "how_many_peerings" {
  description = ""
  type = number
}

variable "origin_vnets" {
  description = ""
  type = list(string)
}

variable "remote_vnets" {
  description = ""
  type = list(string)
}

variable "allow_network_access" {
  description = ""
  type = list(bool)
}
