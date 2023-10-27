locals {
  workspaces_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"

  common_tags = {
    company = var.common_tags_company
    project = var.common_tags_project
    workspace = "${terraform.workspace}"
  }
}