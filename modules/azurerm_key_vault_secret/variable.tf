variable "key_vault_secret" {

  type = map(object({

    key_vault_id = string
    name         = string
    value        = string

  }))

}