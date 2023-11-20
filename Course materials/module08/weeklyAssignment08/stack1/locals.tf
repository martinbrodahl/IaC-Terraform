locals {
  common_tags = {
    project_name = var.common_tags_project_name
    company = var.common_tags_company
  }

  workspaces_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"
  rg_name           = terraform.workspace == "default" ? "${var.rg_name}" : "${var.rg_name}-${local.workspaces_suffix}"
}