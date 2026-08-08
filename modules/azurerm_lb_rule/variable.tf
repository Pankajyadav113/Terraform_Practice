variable "lb_rules" {
  type = map(any)
}

variable "load_balancer_ids" {
  type = map(string)
}

variable "backend_pool_ids" {
  type = map(string)
}

variable "probe_ids" {
  type = map(string)
}