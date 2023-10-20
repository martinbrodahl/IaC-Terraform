# Virtual machine:
variable "vm_rg_name" {
  type = string
  description = "Resource group name for the virtual machine."
}

variable "vm_location" {
  type = string
  description = "Virtual machine location."
}

variable "vm_pip_name" {
  type = string
  description = "Virtual machine Public IP name."
}

variable "vm_nic_name" {
  type = string
  description = "Virtual machine network interface card name."
}

variable "vm_name" {
  type = string
  description = "Virtual machine name."
}

variable "vm_size" {
  type = string
  description = "Virtual machine size."
}

variable "vm_satype" {
  type = string
  description = "Virtual machine storage account type."
}

variable "vm_sku" {
  type = string
  description = "Virtual machine SKU type."
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


# Outputs:
variable "output-001-subnet-id" {
  type = string
  description = "Output number 1: VNET-ID (used for the subnet ID in the NIC configuration)."
}

variable "output-002-vmuser" {
  type = string
  description = "Output nr.2: VM username."
}

variable "output-003-vmpass" {
  type = string
  description = "Output nr.3: VM password."
}