variable "base_name" {
    type = string
    description = "The basename for resources and resource groups"
}

variable "location" {
    type = string
    description = "Resource group location"
}


# Variables for locals
variable "company" {
    type = string
    description = "Company name"
}

variable "project" {
    type = string
    description = "Project name"
}

variable "billing_department" {
    type = string
    description = "Billing department number"
}

variable "owner" {
    type = string
    description = "Project owner"
}
