#!/bin/bash

## ..:: usage function ::..
## ----------------------------------------------------------------------------

usage(){
	echo "
  Usage: $0 <infrastructure_module> [<pip|nopip(default)> | <dns|nodns>]
 
  infrastructure_module: rg | vnet | peering | generic-server

  when using generic-server
  	pip:                   allocates Public IP(s)
  	nopip:                 does not allocate Public IP(s)

  when using vnet
	dns:				   user an internal DNS SERVER (vnet configuration)
	nodns: 				   user Generic Azure DNS for this VNET
"
	exit 1
}

## ..:: main ::..
## ----------------------------------------------------------------------------

IS_LINUX_MODULE_NAME_SET=0

[[ $# -eq 0 ]] && usage

if [[ $1 == "rg" || $1 == "peering" ]]
then
        echo "Setting working dir to $1"
	WORKING_DIR=$1

elif [[ $1 == "generic-server" ]]
then

	echo "Setting working dir to $1"
	WORKING_DIR=$1
	case "$2" in
		"pip" )
		__MODULE_NAME__="linux-server"
		IS_LINUX_MODULE_NAME_SET=1
		;;
		"nopip" )
		__MODULE_NAME__="linux-server-no-public-ip"
		IS_LINUX_MODULE_NAME_SET=1
		;;
	        *)
		usage
	esac

elif [[ $1 == "vnet" ]]
then

	echo "Setting working dir to $1"
	WORKING_DIR=$1
	case "$2" in
		"dns" )
		__LINE_TO_ADD__="  dns_servers         = var.vnet_configurations[count.index].dns_servers"
		IS_DNS=1
		;;
		"nodns" )
		__LINE_TO_ADD__=""
		IS_DNS=1
		;;
	        *)
		usage
	esac

else

	usage

fi


cd $WORKING_DIR
if (( $IS_LINUX_MODULE_NAME_SET ))
then
	echo "Replacing __MODULE_NAME__ with $__MODULE_NAME__"
	cp main.template main.tf
        sed -i "s/__MODULE_NAME__/$__MODULE_NAME__/g" main.tf
fi

if (( $IS_DNS ))
then
	echo "adding line $__LINE_TO_ADD__ to vnet/modules/networking/main.tf"
	cp modules/networking/main.template modules/networking/main.tf
    sed -i "s/__LINE_TO_ADD__/$__LINE_TO_ADD__/g" modules/networking/main.tf
fi

terraform init
terraform plan

read -p "Do you want to actaully appy this? (any key to continue, ctlr+c to exit here)" -n 1 -r
echo    # (optional) move to a new line

terraform apply
