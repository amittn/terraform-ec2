//data "aws_ami" "ec2_ami" {
//  most_recent = true
//  name_regex  = "Ubuntu Server 18.04 LTS (HVM), SSD Volume Type - ami-07dc734dc14746eab"
//  owners      = [""]
//}

resource "aws_security_group" "ec2_sg" {
  name = "${var.environment}-ec2-sg"

  tags {
    "Name" = "${var.environment}-ec2-sg"
  }
}

resource "aws_security_group_rule" "ec2_allow_https_out" {
  type        = "egress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.ec2_sg.id}"
}

# inbound rule for ssh
resource "aws_security_group_rule" "ec2_ssh_in_from_my_ip_22" {
  type            = "ingress"
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"
  cidr_blocks = ["${var.my_ip_address}"]

  security_group_id = "${aws_security_group.ec2_sg.id}"
}

resource "aws_instance" "ec2_a" {
  ami           = "ami-07dc734dc14746eab"
  instance_type = "t2.micro"
  key_name      = "${var.home_public_key}"
  vpc_security_group_ids = ["${aws_security_group.ec2_sg.id}"]

  iam_instance_profile = "${aws_iam_instance_profile.ec2_instance_profile.id}"

  root_block_device {
    volume_type = "gp2"
    volume_size = 8
    delete_on_termination = true
  }

  tags {
    "Name"        = "${var.environment}-ec2-a"
    "Description" = "ec2 instance A"
    "Environment" = "${var.environment}"
  }
}

