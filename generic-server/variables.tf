## ..:: k8s Linux Server Variables ::..
## ---------------------------------------------------------------------------

## ----------------
## ..:: Common ::..
## ----------------
variable "ssh_public_key_file" {
  description  = "By default, each server created by this Terraform module will disable passwd authentication on Ubuntu and use a public key"
  type         = string
  default      = "/home/ubuntu/.ssh/id_rsa.pub"
}

# --------------------
# ..:: k8s-server ::..
# --------------------
variable "ssh_public_key_path" {
  description = ""
  type        = list(string)
}

variable "how_many_servers" {
  description  = "Hostname of the Ubuntu Server in this k8s subnet"
  type         = number
}

variable "server_script_names" {
  description  = "Hostname of the Ubuntu Server in this k8s subnet"
  type         = list(string)
}

variable "server_hostname" {
  description  = "Hostname of the Ubuntu Server in this k8s subnet"
  type         = list(string)
}

variable "server_admin_username" {
  description  = "Hostname of the Ubuntu Server in this k8s subnet"
  type         = list(string)
}

variable "server_vnet_name" {
  description  = ""
  type         = string
}

variable "server_subnet_name" {
  description  = ""
  type         = string
}

variable "server_ip" {
  description  = "Private IP Address of the Ubuntu Server in this k8s subnet"
  type         = list(string)
}

variable "server_nsg_name" {
  description  = "Security group to be used with k8s Servers"
  type         = string
}

variable "server_linuxvm_size" {
  description  = "Security group to be used with k8s Servers"
  type         = list(string)
  default      = ["Standard_DS1_v2"]
}

variable "server_publisher" {
  description  = "Security group to be used with k8s Servers"
  type         = list(string)
}

variable "server_offer" {
  description  = "Security group to be used with k8s Servers"
  type         = list(string)
}

variable "server_sku" {
  description  = "Security group to be used with k8s Servers"
  type         = list(string)
}

variable "server_version" {
  description  = "Security group to be used with k8s Servers"
  type         = list(string)
}
