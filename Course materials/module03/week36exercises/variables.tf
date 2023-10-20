variable "rgnames" {
  type        = list(string)
  description = "Resource group names, in a list"
}

variable "az_locations" {
  type        = list(string)
  description = "Azure resource group locations"
}

variable "sgname" {
  type        = string
  description = "Security group name"
}

variable "VNETnames" {
  type        = list(string)
  description = "Virtual network names, in a list"
}

variable "addressspaces" {
  type        = list(string)
  description = "Address spaces for VNETs, in a list"
}

variable "subnetnames" {
  type        = list(string)
  description = "Subnet names, in a list"
}

variable "sanames" {
  type        = list(string)
  description = "Storage account names, in a list"
}


# Variables for locals:
variable "company" {
  type        = string
  description = "Companyname"
}

variable "project" {
  type        = string
  description = "Project name"
}

variable "bdepart" {
  type        = string
  description = "Billing department"
}

variable "owner" {
  type        = string
  description = "Owner name"
}