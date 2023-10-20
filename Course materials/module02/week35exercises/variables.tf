variable "rgname" {
    type = string
    description = "Resource group name"
    default = "rg-we"
}

variable "location" {
    type = string
    description = "Deployment location"
    default = "West Europe"
}

variable "saname" {
    type = string
    description = "Storage account name"
    default = "mb12345mb"
}

variable "sgname" {
    type = string
    description = "Security group name"
    default = "sg-we"
}

variable "vnname" {
    type = string
    description = "Virtual network name"
    default = "vn-we"
}

variable "snname01" {
    type = string
    description = "Subnet 01 name"
    default = "sn-01-we"
}