variable "key_pair_name" {
  type = string
}

variable "app_id" {
  type    = string
  default = "1815810" # Turbo Sliders Unlimited Dedicated Server
}

variable "admins" {
  type = list(number)
  validation {
    condition     = length(var.admins) > 0
    error_message = "Admin list needs to contain at least one entry"
  }
}

variable "aws_region" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "root_block_size" {
  type    = number
  default = 25
}

variable "server_name" {
  type = string
}
