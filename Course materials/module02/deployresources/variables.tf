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