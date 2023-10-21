# Resource group:
variable "rg_web_name" {
  type        = string
  description = "Static website resource group name"
}

variable "rg_web_location" {
  type        = string
  description = "Static website rg location"
}


# Storage account:
variable "sa_web_name" {
  type        = string
  description = "(optional) describe your variable"
}

variable "source_content" {
  type        = string
  description = "Source content for the index.html file"
}


# Storage blob:
variable "index_document" {
  type        = string
  description = "Name of the index document"
}