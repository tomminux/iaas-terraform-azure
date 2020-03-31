## ..:: Azure VNET Peerings Variables ::..
## ---------------------------------------------------------------------------

peering1_how_many_peerings    = 10
peering1_origin_vnet_names    = ["management","management","management","f5secure","f5secure","f5secure",  "k8s",       "legacy",    "k8s",     "legacy"]
peering1_remote_vnet_names    = ["f5secure",  "k8s",       "legacy",    "k8s",     "legacy",  "management","management","management","f5secure","f5secure" ]
peering1_allow_network_access = [true,        true,        true,        true,      true,      true,        true,         true,        true,     true]

