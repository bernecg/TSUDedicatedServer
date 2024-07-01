data "aws_vpc" "default" {
  default = true
}

data "http" "myip" {
  url = "https://ipv4.icanhazip.com"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "template_file" "user_data" {
  template = file("${path.module}/bootstrap.tpl")
  vars = {
    app_id      = var.app_id
    admins      = local.admins_params
    server_name = var.server_name
  }
}
