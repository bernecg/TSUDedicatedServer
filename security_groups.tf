resource "aws_security_group" "tsu_server" {
  name        = "${var.server_name}_ec2_sg"
  description = "Allow traffic for TSU dedicated server"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
    description = "Personal access"
  }

  ingress {
    from_port   = 7755
    to_port     = 7756
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Server ports"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.server_name}_ec2_sg"
  }
}
