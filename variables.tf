variable "resource_group_name" {
  type        = string
  default     = ""
  description = "description"
}

variable "location" {
  type    = string
  default = ""
}

variable "sku" {
  type = map(string)
  default = {
    tier = "Standard"
    size = "S1"
  }
}

variable "env_name" {
  type    = string
  default = "dev"
}

variable "identifier" {
  type    = string
  default = ""
}

variable "connection_string" {
  type = map(string)
  default = {
    name  = "Database"
    type  = "SQLServer"
    value = ""
  }
}

variable "tags" {
  type    = string
  default = ""
}
