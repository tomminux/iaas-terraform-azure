## ..:: Azure Vnets Variables ::..
## ---------------------------------------------------------------------------

how_many_vnets = 4
vnet_configurations = [
   {
     vnet_name        = "f5secure"
     address_space    = ["10.160.0.0/16"]
   },
   {
     vnet_name        = "management"
     address_space    = ["10.161.0.0/16"]
   },
   {
     vnet_name        = "k8s"
     address_space    = ["10.162.0.0/16"]
   },
   {
     vnet_name        = "legacy"
     address_space    = ["10.163.0.0/16"]
   } 
]  

how_many_subnets = 8
subnet_configurations = [
  {
    vnet_name      = "f5secure"
    subnet_name    = "mgmt"
    address_prefix = "10.160.1.0/24"
  },
  {
    vnet_name      = "f5secure"
    subnet_name    = "internet"
    address_prefix = "10.160.160.0/24"
  },
  {
    vnet_name      = "f5secure"
    subnet_name    = "external"
    address_prefix = "10.160.10.0/24"
  },
  {
    vnet_name      = "f5secure"
    subnet_name    = "internal"
    address_prefix = "10.160.20.0/24"
  },
  {
    vnet_name      = "management"
    subnet_name    = "mgmt"
    address_prefix = "10.161.1.0/24"
  },
  {
    vnet_name      = "management"
    subnet_name    = "production"
    address_prefix = "10.161.10.0/24"
  },
  {
    vnet_name      = "k8s"
    subnet_name    = "production"
    address_prefix = "10.162.10.0/24"
  },
  {
    vnet_name      = "legacy"
    subnet_name    = "production"
    address_prefix = "10.163.10.0/24"
  }
]

## ..:: Azure Network Security Groups Variables ::..
## ---------------------------------------------------------------------------

default_nsg_name = "default"
default_security_rules_configuration = []

ssh_nsg_name     = "allow_ssh"
ssh_security_rules_configuration = [
    {
      in_rule_name         = "allow-ssh-22"
      in_rule_priority     = 100
      in_rule_allow_deny   = "allow"
      in_rule_proto        = "Tcp"
      in_rule_port         = "22"
    }
  ]
