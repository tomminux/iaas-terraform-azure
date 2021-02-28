## ..:: Azure VNets Variables ::..
## ---------------------------------------------------------------------------

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

## ..:: Azure Network Security GorupsVariables ::..
## ---------------------------------------------------------------------------

variable "default_nsg_name" {
  description = ""
  type        = string
}

variable "ssh_nsg_name" {
  description = ""
  type        = string
}

variable "default_security_rules_configuration" {
  description = ""
  type = list(object({
    in_rule_name         = string
    in_rule_priority     = number
    in_rule_allow_deny   = string
    in_rule_proto        = string
    in_rule_port         = string
  }))
}

variable "ssh_security_rules_configuration" {
  description = ""
  type = list(object({
    in_rule_name         = string
    in_rule_priority     = number
    in_rule_allow_deny   = string
    in_rule_proto        = string
    in_rule_port         = string
  }))
}
