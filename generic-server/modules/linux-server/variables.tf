variable "rg_name" {
  description = ""
  type = string
}

variable "prefix_name" {
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

variable "how_many_servers" {
  description = ""
  type = number
}

variable "ssh_key" {
  description = ""
  type = string
}
variable "ssh_public_key_path" {
  description = ""
  type = list(string)
}

variable "linuxvm_script_names" {
  description = ""
  type = list(string)
}

variable "linuxvm_hostname" {
  description = ""
  type = list(string)
}

variable "linuxvm_admin_username" {
  description = ""
  type = list(string)
}

variable "vnet_name" {
  description = ""
  type = string
}

variable "subnet_name" {
  description = ""
  type = string
}

variable "nsg_name" {
  description = ""
  type = string
}

variable "linuxvm_subnet_ip" {
  description = ""
  type = list(string)
}

variable "linuxvm_size" {
  description = ""
  type = list(string)
  default = ["Standard_DS1_v2"]
}

variable "publisher" {
  description = ""
  type = list(string)
}

variable "offer" {
  description = ""
  type = list(string)
}

variable "sku" {
  description = ""
  type = list(string)
}

variable "disti_version" {
  description = ""
  type = list(string)
  default = ["latest"]
}

