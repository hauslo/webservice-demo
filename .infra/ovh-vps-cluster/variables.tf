
variable "region" {
  type    = string
}

variable "key" {
  type = object({
    name     = string
    key      = string
  })
}

variable "volumes" {
  type    = list(object({
      name     = string
      size     = number
  }))
  default = []
}

variable "hosts" {
  type    = list(object({
    name        = string
    metadata    = any
    flavor_name = string
  }))
  default = []
}

variable "mount" {
  type    = list(object({
    host   = string
    volume = string
  }))
  default = []
}

variable "inventory_file" {
  type = string
}
