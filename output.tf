output "ec2_public_ip_address" {
  value = "${aws_instance.ec2_a.associate_public_ip_address}"
}

output "ec2_availability_zone" {
  value = "${aws_instance.ec2_a.availability_zone}"
}

output "ec2_count" {
  value = "${aws_instance.ec2_a.count}"
}