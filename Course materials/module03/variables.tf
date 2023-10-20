# Alle variabler samlet på en og samme fil, MERK at alle .tf filer må ligge i samme mappe!

variable "location" {
  type        = string
  description = "Deployment location" # Se description!
  default     = "West Europe"
}

variable "rgname" {
  type        = string
  description = "Resource Group Name" # Se description!
  default     = "rg-demo-terraform"
}

variable "saname" {
  type        = string
  description = "Storage account name" # Se description!
}

variable "company" {
  type        = string
  description = "Company name"
}

variable "project" {
  type        = string
  description = "Project name"
}

variable "billing_code" {
  type        = string
  description = "Billing code"
}

variable "az_regions" {
  type        = list(string)
  description = "Azure regions for resources"
  default     = ["westeurope", "northeurope"]
}

variable "vmsize" {
  type = map(string)
  default = {
    "small"  = "Standard_B1s"
    "medium" = "Standard_B2s"
    "large"  = "Standard_B4ms"
  }
}