variable "vnet_name" {
  description = "Please enter the name of the Vnet"
  type        = string
  default     = ""
}
variable "vnet_rg_location" {

  description = "Please enter the location for Hub Vnet"
  type        = string
  default     = ""
}

variable "vnet_rg_name" {
  description = "Please enter the resource group name for Vnet"
  type        = string
  default     = ""
}
variable "vnet_address_space" {
  description = "Please enter an address space for Vnet"
  default     = ""
}
