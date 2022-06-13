variable "vpn_rg_name" {
  description = "Name of the VPN RG"
}

variable "vpn_rg_location" {
  description = "location of the VPN RG"
}

variable "hub_vnet_name" {
  description = "Name of the Vnet to thich VPN should be connected"
}

variable "gateway_address" {
  description = "Gateway Subnet Address"
}


#===== Local Network Gateway =====

variable "lng_name" {
  description = "Local Network Gateway name"
}

variable "lng_public_ip" {
  description = "Local Network Gateway Public IP"
}

variable "lng_address_space" {
  description = "Local Network Gateway addresses"
}
#===== Virtual Network Gateway =====

variable "vng_pip_name" {
  description = " Name of Virtual Network Gateway public IP"
}

variable "vng_name" {
  description = "Virtual Network Gateway public IP"
}

variable "vng_sku" {
  description = "Virtual Network Gateway SKU"
  default     = "VpnGw2"
}

variable "vpn_connection_name" {
  description = "VPN connection name"
  default     = "S2Sconnection"
}

variable "vpn_encryption_type" {
  default = "IPsec"
}

variable "vpn_shared_key" {
  default = "4-v3ry-53cr37-1p53c-5h4r3d-k3y"
}