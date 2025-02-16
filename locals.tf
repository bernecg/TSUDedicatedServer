locals {
  prefix_name   = "tsu"
  admins_params = join(" -admin ", var.admins)
}
