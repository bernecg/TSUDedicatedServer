resource "aws_instance" "tsu_server" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = var.key_pair_name
  vpc_security_group_ids      = [aws_security_group.tsu_server.id]
  associate_public_ip_address = true
  user_data                   = data.template_file.user_data.rendered

  root_block_device {
    volume_size = var.root_block_size
    volume_type = "gp2"
  }

  tags = {
    Name = "${local.prefix_name}_server"
  }
}
