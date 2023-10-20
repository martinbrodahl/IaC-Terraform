# Network:
variable "vnet_rg_name" {
    type = string
    description = "Resource group name for the virtual network."
}

variable "vnet_location" {
    type = string
    description = "Virtual network location."
}

variable "vnet_name" {
    type = string
    description = "Virtual network name."
}

variable "nsg_name" {
    type = string
    description = "Network security group name"
}

variable "nsg_personal_pip" {
    type = string
    description = "Personal public IP address, set to be allowed by the NSG."
}

variable "vnet_subnet_name" {
    type = string
    description = "Name of the subnet in the virtual network."
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
