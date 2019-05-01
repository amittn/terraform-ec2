variable "environment" {
  type = "string"
  description = "The name of the environment within the project"
  default = "dev"
}

variable "home_public_key" {
  type = "string"
  description = "ec2 instance access key"
  default = "home-aws-key-pair"
}

variable "my_ip_address" {
  type = "string"
  description = "my ip address cidr block"
}
