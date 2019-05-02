variable "environment" {
  type = "string"
  description = "The name of the environment within the project"
  default = "dev"
}

variable "ec2_key_pair" {
  type = "string"
  description = "ec2 instance access key"
}

variable "my_ip_address" {
  type = "string"
  description = "my ip address cidr block"
}
