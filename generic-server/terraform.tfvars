## ..:: Linux Servers Variables ::..
## ---------------------------------------------------------------------------

## ..:: Common ::..
ssh_public_key_file     = "/home/ubuntu/.ssh/azure.pub"
ssh_public_key_path     = ["/home/ubuntu/.ssh/authorized_keys"]
#ssh_public_key_path     = ["/home/debian/.ssh/authorized_keys"]

## ..:: Servers Variables ::..
how_many_servers = 1
#server_script_names   = ["generic-server-debian"]
server_script_names   = ["generic-server-ubuntu"]
server_hostname       = ["docker-server"]
server_admin_username = ["debian"]
server_vnet_name      = "legacy"
server_subnet_name    = "production"
server_ip             = ["10.163.10.102"]
server_nsg_name       = "allow_ssh"

server_linuxvm_size   = ["Standard_DS1_v2"]

## ..:: UNCOMMNENT HERE FOR UBUNTU SERVER 18.04 ::..
## ----------------------------------------------------------------------------
server_publisher      = ["Canonical"]
server_offer          = ["UbuntuServer"]
server_sku            = ["18.04-LTS"]
server_version        = ["latest"]

## ..:: UNCOMMNENT HERE FOR DEBIAN SERVER 10 Gen2 ::..
## ----------------------------------------------------------------------------
#server_publisher      = ["debian"]
#server_offer          = ["debian-10"]
#server_sku            = ["10-gen2"]
#server_version        = ["latest"]
