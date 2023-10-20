# Resource group:
variable "rg_backend_name" {
  type        = string
  description = "Backend resource group name"
}

variable "rg_backend_location" {
  type        = string
  description = "Backend resource group location"
}


# Storage account:
variable "sa_backend_name" {
  type        = string
  description = "Backend storage accouunt name"
}


# Storage container:
variable "sc_backend_name" {
  type        = string
  description = "Backend storage account name"
}