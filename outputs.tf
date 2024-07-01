output "ssh_user_and_dns" {
  value = "ubuntu@${aws_instance.tsu_server.public_dns}"
}
