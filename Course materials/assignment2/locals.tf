locals {
  workspaces_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"
}