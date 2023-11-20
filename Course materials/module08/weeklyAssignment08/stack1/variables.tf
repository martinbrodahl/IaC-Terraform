variable "rg_name" {
    type = string
    description = "Resource group name"
    default = "rg-westeu-01"
}

variable "location" {
    type = string
    description = "Infrastructure stack location"
    default = "West Europe"
    sensitive = true
}

variable "common_tags_project_name" {
    type = string
    description = "Project name"
    default = "Module 08"
}

variable "common_tags_company" {
    type = string
    description = "Company name"
    default = "Module 08 Company"
}