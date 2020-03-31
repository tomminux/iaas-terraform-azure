## ..:: Resource Group Creation ::..
## ----------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12"
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-rg"
  location = var.location_name

  tags = {
    owner = var.owner_name
  }
}
