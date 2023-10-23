# Resource group:
variable "rg_web_name" {
  type        = string
  description = "Static website resource group name"
  default = "rg-web-week40"
}

variable "rg_web_location" {
  type        = string
  description = "Static website rg location"
  default = "westeurope"
}


# Storage account:
variable "sa_web_name" {
  type        = string
  description = "(optional) describe your variable"
  default = "sawebweek40"
}

variable "source_content" {
  type        = string
  description = "Source content for the index.html file"
  default = "<h1>Web page created with Terraform</h1>"
}


# Storage blob:
variable "index_document" {
  type        = string
  description = "Name of the index document"
  default = "index.html"
}