rgs = {
  rg1 = {
    name     = "rg-dhondhu"
    location = "japaneast"
  }
}

vnets = {
  vnet1 = {
    name                = "vnet-dhondhu"
    location            = "japaneast"
    resource_group_name = "rg-dhondhu"
    address_space       = ["10.0.0.0/16"]
  }
}

sntes = {
  frontrnd_snet = {
    name                 = "frontrnd-subnet"
    resource_group_name  = "rg-dhondhu"
    virtual_network_name = "vnet-dhondhu"
    address_prefixes     = ["10.0.1.0/24"]
  }
  backend_snet = {
    name                 = "backend-subnet"
    resource_group_name  = "rg-dhondhu"
    virtual_network_name = "vnet-dhondhu"
    address_prefixes     = ["10.0.2.0/24"]
  }
  bastion = {
    name                 = "AzureBastionSubnet"
    virtual_network_name = "vnet-dhondhu"
    resource_group_name  = "rg-dhondhu"
    address_prefixes     = ["10.0.3.0/26"]
  }
  private_endpoint_snet = {
    name                 = "private-endpoint-subnet"
    resource_group_name  = "rg-dhondhu"
    virtual_network_name = "vnet-dhondhu"
    address_prefixes     = ["10.0.4.0/24"]
  }

}

pips = {
  pip1 = {
    name                = "pip1"
    location            = "japaneast"
    resource_group_name = "rg-dhondhu"
    allocation_method   = "Static"
    # sku                 = "Dynamic"
  }

  pip2 = {
    name                = "pip2"
    location            = "japaneast"
    resource_group_name = "rg-dhondhu"
    allocation_method   = "Static"
    # sku                 = "Dynamic"
  }

}

nics = {
  nic1 = {
    nic_name            = "nic-01"
    location            = "japaneast"
    resource_group_name = "rg-dhondhu"

    ip_configuration_name = "internal"
    subnet_name           = "frontrnd-subnet"
    virtual_network_name  = "vnet-dhondhu"

    # public_ip_name                = "pip1"
    private_ip_address_allocation = "Dynamic"
  }

  nic2 = {
    nic_name            = "nic-02"
    location            = "japaneast"
    resource_group_name = "rg-dhondhu"

    subnet_name          = "backend-subnet"
    virtual_network_name = "vnet-dhondhu"
    # public_ip_name = "pip2"

    private_ip_address_allocation = "Dynamic"
    ip_configuration_name         = "internal"
  }
}

vms = {
  vm1 = {
    name                = "vm-01"
    location            = "japaneast"
    resource_group_name = "rg-dhondhu"
    nic_name            = "nic-01"

    size = "Standard_D2as_v4"

    admin_username = "azureuser"
    public_key     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCykfMuKYpOm0QjJTrrvInXpGS0nvtjpSO3DKfE7FE1c7GhJxIxKiupcTxDcEBIASMP/d+04PvLVkHeudPfQv6nYRh6YVm0Hv2N806/LH6ostzxHNFt5R162G2NYG1pxWgEjI5nC+4WF4pLnHjbe0yySITk4QFvklRH0Vgz4CCRJc6KeCniltEOP/zFBKgu4gX1mcoGNLA85553KXH3ts2YAc2NydYnj/18KtYn4TZNa8NSViZYH0LOWdsjyWMBtH8dXdIDJau89IdhDpkyx24ufU9GzoKFRO38E9ICFMHDrRWKyfl30JNWNYCSrFGqWz9xsnkqbO1HyigbESSZ/wEzpcC7ksTjS98IyeYAX+RxeuhX9ZcAvb0BZwRevl9C1O5hN8T87X9gNNClcw6jV8+C8TSBy7zmH5kEJ9wqn738d8UbFq3qrz6+Eoh+ehwRxsvhxqiQaUbC/ad1cjAZE4K0lBpsXjZj8eEzq9YAnDLBs9z9hwqEsML+P2Uuz+NToYvy5pDOvZ2+dnjUABXkzeTBH+vUWYr/qgKjvqkou/wVDNJr6PeV5E5CaaGy7qYQxnZ4Is8lMmlQmZ/ZFpZUTjOseU3DeM5PTRsFiNhcI5Kk0x3siJL32znOHXy+L/EwFXQrps76u8eVeKqsMKUOrgQ6hl2JpF4uKrQWhtYdCoe9QQ== panka@LAPTOP-0ALNSCP9"

    # network_interface_name = "nic-01"

    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  vm2 = {
    name                = "vm-02"
    location            = "japaneast"
    resource_group_name = "rg-dhondhu"
    nic_name            = "nic-02"
    size                = "Standard_D2as_v4"

    admin_username = "azureuser"
    public_key     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCykfMuKYpOm0QjJTrrvInXpGS0nvtjpSO3DKfE7FE1c7GhJxIxKiupcTxDcEBIASMP/d+04PvLVkHeudPfQv6nYRh6YVm0Hv2N806/LH6ostzxHNFt5R162G2NYG1pxWgEjI5nC+4WF4pLnHjbe0yySITk4QFvklRH0Vgz4CCRJc6KeCniltEOP/zFBKgu4gX1mcoGNLA85553KXH3ts2YAc2NydYnj/18KtYn4TZNa8NSViZYH0LOWdsjyWMBtH8dXdIDJau89IdhDpkyx24ufU9GzoKFRO38E9ICFMHDrRWKyfl30JNWNYCSrFGqWz9xsnkqbO1HyigbESSZ/wEzpcC7ksTjS98IyeYAX+RxeuhX9ZcAvb0BZwRevl9C1O5hN8T87X9gNNClcw6jV8+C8TSBy7zmH5kEJ9wqn738d8UbFq3qrz6+Eoh+ehwRxsvhxqiQaUbC/ad1cjAZE4K0lBpsXjZj8eEzq9YAnDLBs9z9hwqEsML+P2Uuz+NToYvy5pDOvZ2+dnjUABXkzeTBH+vUWYr/qgKjvqkou/wVDNJr6PeV5E5CaaGy7qYQxnZ4Is8lMmlQmZ/ZFpZUTjOseU3DeM5PTRsFiNhcI5Kk0x3siJL32znOHXy+L/EwFXQrps76u8eVeKqsMKUOrgQ6hl2JpF4uKrQWhtYdCoe9QQ== panka@LAPTOP-0ALNSCP9"

    # network_interface_name = "nic-02"

    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

key_vault = {
  kv1 = {
    name                = "kv-pankaj"
    location            = "japaneast"
    resource_group_name = "rg-dhondhu"
    tenant_id           = "2490be3d-97ba-4b0e-b2c9-f4d12e633b4b"
    sku_name            = "standard"
  }
}


nsgs = {
  frontrnd_nsg = {
    name                = "frontend-nsg"
    location            = "japaneast"
    resource_group_name = "rg-dhondhu"
  }

  backend_nsg = {
    name                = "backend-nsg"
    location            = "japaneast"
    resource_group_name = "rg-dhondhu"
  }
}

nsg_association = {
  frontend = {
    subnet_name = "frontrnd-subnet"
    nsg_name    = "frontend-nsg"
  }

  backend = {
    subnet_name = "backend-subnet"
    nsg_name    = "backend-nsg"
  }
}


nsg_rules = {

  frontend_ssh = {
    name                        = "Allow-SSH-Frontend"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "22"
    source_address_prefix       = "10.0.3.0/26"
    destination_address_prefix  = "*"
    resource_group_name         = "rg-dhondhu"
    network_security_group_name = "frontend-nsg"
  }

  # frontend_http = {
  #   name                        = "Allow-HTTP-Frontend"
  #   priority                    = 110
  #   direction                   = "Inbound"
  #   access                      = "Allow"
  #   protocol                    = "Tcp"
  #   source_port_range           = "*"
  #   destination_port_range      = "80"
  #   source_address_prefix       = "Internet"
  #   destination_address_prefix  = "*"
  #   resource_group_name         = "rg-dhondhu"
  #   network_security_group_name = "frontend-nsg"
  # }

  frontend_https = {
    name                        = "Allow-HTTPS-Frontend"
    priority                    = 120
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "443"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    resource_group_name         = "rg-dhondhu"
    network_security_group_name = "frontend-nsg"
  }

  backend_ssh = {
    name                        = "Allow-SSH-Backend"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "22"
    source_address_prefix       = "10.0.3.0/26"
    destination_address_prefix  = "*"
    resource_group_name         = "rg-dhondhu"
    network_security_group_name = "backend-nsg"
  }
}


load_balancers = {
  lb1 = {
    name                = "lb-dhondhu"
    location            = "japaneast"
    resource_group_name = "rg-dhondhu"
    sku                 = "Standard"

    frontend_ip_configuration_name = "frontend-ip"

    # Existing Public IP name
    public_ip_name = "pip1"
  }
}


backend_pools = {

  pool1 = {
    name               = "backend-pool"
    load_balancer_name = "lb-dhondhu"
  }

}


nic_associations = {

  vm1 = {
    nic_name              = "nic-01"
    ip_configuration_name = "internal"
    backend_pool_name     = "backend-pool"
  }

  vm2 = {
    nic_name              = "nic-02"
    ip_configuration_name = "internal"
    backend_pool_name     = "backend-pool"
  }

}


lb_probes = {

  probe1 = {
    name                = "http-probe"
    load_balancer_name  = "lb-dhondhu"
    protocol            = "Tcp"
    port                = 80
    interval_in_seconds = 5
    number_of_probes    = 2
  }

}


lb_rules = {

  http = {

    name = "http-rule"

    load_balancer_name = "lb-dhondhu"

    frontend_ip_configuration_name = "frontend-ip"

    backend_pool_name = "backend-pool"

    probe_name = "http-probe"

    protocol = "Tcp"

    frontend_port = 80

    backend_port = 80

  }

}


bastions = {

  bastion1 = {

    name = "bastion-dhondhu"

    location = "japaneast"

    resource_group_name = "rg-dhondhu"

    sku = "Standard"

    public_ip_name = "pip2"

    ip_configuration_name = "bastion-ipconfig"

  }

}

