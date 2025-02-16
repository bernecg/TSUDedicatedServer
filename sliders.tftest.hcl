mock_provider "aws" {
  override_data {
    target = data.aws_ami.ubuntu
    values = {
      id = "ami-0123456abcdef789z"
    }
  }

  override_data {
    target = data.aws_vpc.default
    values = {
      id = "vpc-0123456abcdef789z"
    }
  }
}

mock_provider "http" {
  override_data {
    target = data.http.myip
    values = {
      response_body = "123.123.123.123"
    }
  }
}

variables {
  key_pair_name = "key_pair_name"
  aws_region    = "us-east-1"
  server_name   = "dummy_tsu"
  instance_type = "t3.medium"

  admins = [
    12345678901234567,
    98765432109876543
  ]
}

run "basic_test" {
  command = plan

  # AWS Instance
  assert {
    condition     = aws_instance.tsu_server.ami == "ami-0123456abcdef789z"
    error_message = "AMI set for instance is wrong"
  }
  assert {
    condition     = aws_instance.tsu_server.instance_type == "t3.medium"
    error_message = "Instance type set for instance is wrong"
  }
  assert {
    condition     = strcontains(aws_instance.tsu_server.user_data, "12345678901234567") == true
    error_message = "user_data set for instance does not have given Admin ID"
  }
  assert {
    condition     = aws_instance.tsu_server.root_block_device[0].volume_size == 25
    error_message = "Volume size of Root block device is wrong"
  }
  assert {
    condition     = aws_instance.tsu_server.tags["Name"] == "dummy_tsu_server"
    error_message = "Instance name is wrong"
  }

  # Security Group
  assert {
    condition     = aws_security_group.tsu_server.vpc_id == "vpc-0123456abcdef789z"
    error_message = "Wrong VPC ID set in Security Group"
  }
  assert {
    condition     = aws_security_group.tsu_server.name == "dummy_tsu_ec2_sg"
    error_message = "Wrong name set for Security Group"
  }
  assert {
    condition     = length(aws_security_group.tsu_server.ingress) == 2
    error_message = "Wrong number of ingress rule in Security Group"
  }
  assert {
    # TODO: improve hardcoding get personal access ingress with index 1
    condition     = tolist(aws_security_group.tsu_server.ingress)[1].cidr_blocks[0] == "123.123.123.123/32"
    error_message = "Wrong IP set for personal access"
  }
}
