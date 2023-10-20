locals {
  common_tags = {
    company            = var.company
    project            = "${var.company} - ${var.project}"
    billing_department = var.bdepart
    owner              = var.owner
  }
}