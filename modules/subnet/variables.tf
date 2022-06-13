variable "subnet_name" {
  description = "Name of the subnet"
  default     = ""
}

variable "subnet_rg_name" {
  description = "RG of the subnet"
  default     = ""
}

variable "vnet_name" {
  description = "Location of the Vnet to which the subnet belongs"
  default     = ""
}

variable "subnet_addresses" {
  description = "Address of the subnet"
  default     = ""
}