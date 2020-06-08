output "sg-public-id" {
  value = "${aws_security_group.SG_public_22_80_443.id}"
}

output "sg-front-id" {
  value = "${aws_security_group.SG_front_22_80_443.id}"
}

output "sg-back-id" {
  value = "${aws_security_group.SG_back_22_3306.id}"
}