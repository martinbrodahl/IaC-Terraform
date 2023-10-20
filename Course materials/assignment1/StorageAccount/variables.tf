# Storage account:
variable "sa_rg_name" {
    type = string
    description = "Resource group name for the storage account."
}

variable "sa_location" {
    type = string
    description = "Storage account location."
}

variable "sa_name" {
    type = string
    description = "Storage acccount name."
}

variable "sa_container_name" {
    type = string
    description = "Storage account container name."
}


# Locals:
variable "common_tags_name" {
    type = string
    description = "Name in the 'common_tags' local variable."
}

variable "common_tags_company" {
  type = string
  description = "Company name in the 'common_tags' local variable."
}

variable "common_tags_project" {
  type = string
  description = "Project name in the 'common_tags' local variable."
}