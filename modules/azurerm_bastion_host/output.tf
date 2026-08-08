output "bastion_id" {

  value = {

    for _, v in azurerm_bastion_host.bastion :

    v.name => v.id

  }

}