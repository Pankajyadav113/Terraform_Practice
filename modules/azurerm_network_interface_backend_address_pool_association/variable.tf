variable "nic_associations" {
  type = map(any)
}

variable "nic_ids" {
  type = map(string)
}

variable "backend_pool_ids" {
  type = map(string)
}