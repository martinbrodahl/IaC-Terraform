locals {
  workspaces_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"

  rg_web_name = "${var.rg_web_name}-${local.workspaces_suffix}"
  sa_web_name = "${var.sa_web_name}${local.workspaces_suffix}"
  source_content = "${var.source_content}-<p>${local.workspaces_suffix}<p>"

  common_tags = {
    owner = "Martin Brodahl"
    billing = "123abcKontonr"
  }
}