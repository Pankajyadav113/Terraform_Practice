variable "association" {
  type = map(any)
}

variable "subnet_ids" {
  type = map(string)
}

variable "nsg_ids" {
  type = map(string)
}