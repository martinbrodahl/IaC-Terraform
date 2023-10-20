/*
variable "base_name" {
    type = string
    description = "The basename for resources."
}
*/

# Network:
variable "vnet_rg_name" {
  type        = string
  description = "Resource group name for the virtual network."
}

variable "vnet_location" {
  type        = string
  description = "Virtual network location."
}

variable "vnet_name" {
  type        = string
  description = "Virtual network name."
}

variable "nsg_name" {
  type        = string
  description = "Network security group name"
}

variable "nsg_personal_pip" {
  type        = string
  description = "Personal public IP address, set to be allowed by the NSG."
}

variable "vnet_subnet_name" {
  type        = string
  description = "Name of the subnet in the virtual network."
}


# Storage account:
variable "sa_rg_name" {
  type        = string
  description = "Resource group name for the storage account."
}

variable "sa_location" {
  type        = string
  description = "Storage account location."
}

variable "sa_name" {
  type        = string
  description = "Storage acccount name."
}

variable "sa_container_name" {
  type        = string
  description = "Storage account container name."
}


# Virtual machine:
variable "vm_rg_name" {
  type        = string
  description = "Resource group name for the virtual machine."
}

variable "vm_location" {
  type        = string
  description = "Virtual machine location."
}

variable "vm_pip_name" {
  type        = string
  description = "Virtual machine Public IP name."
}

variable "vm_nic_name" {
  type        = string
  description = "Virtual machine network interface card name."
}

variable "vm_name" {
  type        = string
  description = "Virtual machine name."
}

variable "vm_size" {
  type        = string
  description = "Virtual machine size."
}

variable "vm_satype" {
  type        = string
  description = "Virtual machine storage account type."
}

variable "vm_sku" {
  type        = string
  description = "Virtual machine SKU type."
}


# Key vault:
variable "kv_rg_name" {
  type        = string
  description = "Key vault resource group name."
}

variable "kv_location" {
  type        = string
  description = "Key vault location."
}

variable "kv_name" {
  type        = string
  description = "Key vault name."
}

variable "kv_sku_name" {
  type        = string
  description = "Key vault sku name."
}

variable "kv_secret_saaccesskey_name" {
  type        = string
  description = "Key vault secret name, for the secret holding the storage account access key."
}

variable "kv_secret_vmuser_name" {
  type        = string
  description = "Key vault secret name, for the secret holding the VM username."
}

variable "kv_secret_vmuser" {
  type        = string
  description = "Key vault secret, the VM username."
}

variable "kv_secret_vmpass_name" {
  type        = string
  description = "Key vault secret name, for the secret holding the VM password."
}

variable "kv_secret_vmpass" {
  type        = string
  description = "Key vault secret, the VM password."
}

/*
variable "kv_secret_vmpass_name" {
  type = string
  description = "Key vault secret name, for the secret holding the VM password."
}
*/


# Locals:
variable "common_tags_name" {
  type        = string
  description = "Name in the 'common_tags' local variable."
}

variable "common_tags_company" {
  type        = string
  description = "Company name in the 'common_tags' local variable."
}

variable "common_tags_project" {
  type        = string
  description = "Project name in the 'common_tags' local variable."
}
