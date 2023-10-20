# Key vault:
variable "kv_rg_name" {
  type = string
  description = "Key vault resource group name."
}

variable "kv_location" {
  type = string
  description = "Key vault location."
}

variable "kv_name" {
  type = string
  description = "Key vault name."
}

variable "kv_sku_name" {
  type = string
  description = "Key vault sku name."
}

variable "kv_secret_saaccesskey_name" {
  type        = string
  description = "Key vault secret name, for the secret holding the storage account access key."
}

variable "kv_secret_vmuser_name" {
  type = string
  description = "Key vault secret name, for the secret holding the VM username."
}

variable "kv_secret_vmuser" {
  type = string
  description = "Key vault secret, the VM username."
}

variable "kv_secret_vmpass_name" {
  type = string
  description = "Key vault secret name, for the secret holding the VM password."
}

variable "kv_secret_vmpass" {
  type = string
  description = "Key vault secret, the VM password."
}


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


# Outputs:
variable "output-001-sa-accesskey" {
  type = string
  description = "Output nr.1: Storage account access key."
}  