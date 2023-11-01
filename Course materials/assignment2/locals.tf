locals {
  workspaces_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"

  rg_name           = terraform.workspace == "default" ? "${var.rg_name}" : "${var.rg_name}-${local.workspaces_suffix}"
  sa_name           = terraform.workspace == "default" ? "${var.sa_name}" : "${var.sa_name}${local.workspaces_suffix}"
  sc_name           = terraform.workspace == "default" ? "${var.sc_name}" : "${var.sc_name}-${local.workspaces_suffix}"
  nsg_name          = terraform.workspace == "default" ? "${var.nsg_name}" : "${var.nsg_name}-${local.workspaces_suffix}"
  vnet_name         = terraform.workspace == "default" ? "${var.vnet_name}" : "${var.vnet_name}-${local.workspaces_suffix}"
  subnet_name       = terraform.workspace == "default" ? "${var.subnet_name}" : "${var.subnet_name}-${local.workspaces_suffix}"
  kv_name           = terraform.workspace == "default" ? "${var.kv_name}" : "${var.kv_name}-${local.workspaces_suffix}"
  sa_accesskey_name = terraform.workspace == "default" ? "${var.sa_accesskey_name}" : "${var.sa_accesskey_name}-${local.workspaces_suffix}"
  vm_name           = terraform.workspace == "default" ? "${var.vm_name}" : "${var.vm_name}-${local.workspaces_suffix}"
  pip_name          = terraform.workspace == "default" ? "${var.pip_name}" : "${var.pip_name}-${local.workspaces_suffix}"
  vm_nic_name       = terraform.workspace == "default" ? "${var.vm_nic_name}" : "${var.vm_nic_name}-${local.workspaces_suffix}"

  common_tags = {
    company   = var.common_tags_company
    project   = var.common_tags_project
    workspace = "${terraform.workspace}"
  }
}