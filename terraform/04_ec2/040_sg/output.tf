output "sg-public-ids" {
  value = "${aws_security_group.SG_public_22_80_443.id}"
}

output "sg-front-ids" {
  value = "${aws_security_group.SG_front_22_80_443.id}"
}

output "sg-back-ids" {
  value = "${aws_security_group.SG_back_22_3306.id}"
}