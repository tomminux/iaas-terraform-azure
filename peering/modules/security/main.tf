## ..:: Azure Security Group Creation ::..
## --------------------------------------------------------------------------

resource "azurerm_network_security_group" "nsg" {

  name                = "${var.prefix_name}-${var.nsg_name}-nsg"
  location            = var.location_name
  resource_group_name = var.rg_name

  dynamic "security_rule" {
    for_each = var.security_rules_configuration
      content {
        name                       = security_rule.value["in_rule_name"]
        priority                   = security_rule.value["in_rule_priority"]
        direction                  = "Inbound"
        access                     = security_rule.value["in_rule_allow_deny"]
        protocol                   = security_rule.value["in_rule_proto"]
        source_port_range          = "*"
        destination_port_range     = security_rule.value["in_rule_port"]
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      } 
    }

  tags = {
    owner = var.owner_name
  }
}
