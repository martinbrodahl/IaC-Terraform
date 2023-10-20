variable "rgname" {
  type        = string
  description = "Resource group name (excluded base name)"
}

variable "location" {
  type        = string
  description = "Resource group location"
}

variable "nsgname" {
    type = string
    description = "Network Security Group name"
}


# Variables for locals
variable "company" {
  type        = string
  description = "Company name"
}

variable "project" {
  type        = string
  description = "Project name"
}

variable "billing_department" {
  type        = string
  description = "Billing department number"
}

variable "owner" {
  type        = string
  description = "Project owner"
}