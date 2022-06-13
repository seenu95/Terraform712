variable "tenant" {
  description = "Please provide the tenant ID."
  type        = string
  default     = "a13d8ae2a40d6e8"
}

variable "client" {
  description = "Please provide the client ID."
  type        = string
  default     = "30496487-2ff053640d534a"
}

variable "secret" {
  description = "Please provide the client secret."
  type        = string
  sensitive   = true
  default     = "i1g7Q~fAWx1UiL86E3fBNi9"
}

variable "subscriptionshub" {
  description = "Please provide the subscription IDs."
  type        = string
  default     = "180be318-3bda-484b-9b28-27ffcbe8b622"
}
