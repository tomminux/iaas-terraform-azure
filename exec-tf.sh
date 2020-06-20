#!/bin/bash

## ..:: usage function ::..
## ----------------------------------------------------------------------------

usage(){
	echo "
  Usage: $0 <infrastructure_module> [<pip|nopip(default)>]
 
  infrastructure_module: rg | vnet | peering | generic-server
  pip:                   allocates Public IP(s)
  nopip:                 does not allocate Public IP(s)
"
	exit 1
}

## ..:: main ::..
## ----------------------------------------------------------------------------

IS_MODULE_NAME_SET=0

[[ $# -eq 0 ]] && usage

if [[ $1 == "rg" || $1 == "vnet" || $1 == "peering" ]]
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
		IS_MODULE_NAME_SET=1
		;;
		"nopip" )
		__MODULE_NAME__="linux-server-no-public-ip"
		IS_MODULE_NAME_SET=1
		;;
	        *)
		usage
	esac

else

	usage

fi


cd $WORKING_DIR
if (( $IS_MODULE_NAME_SET ))
then
	echo "Replacing __MODULE_NAME__ with $__MODULE_NAME__"
	cp main.template main.tf
        sed -i "s/__MODULE_NAME__/$__MODULE_NAME__/g" main.tf
fi

terraform init
terraform plan

read -p "Do you want to actaully appy this? (any key to continue, ctlr+c to exit here)" -n 1 -r
echo    # (optional) move to a new line
#if [[ $REPLY =~ ^[Yy]$ ]]
#then
    terraform apply
#else
#    echo "Got it, you just wanted to test it, fair enough! Ciao"
#    exit 0
#fi

