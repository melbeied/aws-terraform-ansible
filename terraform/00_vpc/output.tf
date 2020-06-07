## Variables being exported for downstream consumption
output "name" {
  value = "${var.vpc_name}"
}

output "id" {
  value = "${aws_vpc.vpc.id}"
}

output "region" {
  value = "${var.vpc_region}"
}
output "cidr" {
  value = "${aws_vpc.vpc.cidr_block}"
}