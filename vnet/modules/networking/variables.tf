##
## ----------------------------------------------------------------------------

variable "prefix_name" {
  description = ""
  type = string
}

variable "rg_name" {
  description = ""
  type = string
}

  variable "vnet_location" {
  description = ""
  type = string
}

variable "vnet_owner" {
  description = ""
  type = string
  default = "paoloa"
}

variable "how_many_vnets" {
  description = ""
  type = number
}

variable "vnet_configurations" {
  description = ""
  type = list(object({
    vnet_name        = string
    address_space    = list(string)
    dns_servers      = list(string)
  }))
} 

variable "how_many_subnets" {
  description = ""
  type = number
}

variable "subnet_configurations" {
  description = ""
  type = list(object({
    vnet_name = string
    subnet_name = string
    address_prefix = string
  }))
}
