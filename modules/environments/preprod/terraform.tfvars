rgs = {
  rg1 = {
    name     = "rg-dhondhu"
    location = "centralindia"
  }
}

vnets = {
  vnet1 = {
    name                = "vnet-dhondhu"
    location            = "centralindia"
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
  backend_snte = {
    name                 = "backend-subnet"
    resource_group_name  = "rg-dhondhu"
    virtual_network_name = "vnet-dhondhu"
    address_prefixes     = ["10.0.2.0/24"]
  }
}

pips = {
  pip1 = {
    name                = "pip1"
    location            = "centralindia"
    resource_group_name = "rg-dhondhu"
    allocation_method   = "Static"
    # sku                 = "Dynamic"
  }
}