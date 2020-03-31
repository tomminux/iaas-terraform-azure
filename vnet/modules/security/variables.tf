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

variable "nsg_name" {
  description = ""
  type = string
}

variable "location_name" {
  description = ""
  type = string
}

variable "owner_name" {
  description = ""
  type = string
}

variable "security_rules_configuration" {
  description = ""
  type = list(map(string))
}
