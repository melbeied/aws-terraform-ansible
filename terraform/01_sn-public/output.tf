output "public-sn-ids" {
  value = "${aws_subnet.public.*.id}"
}

output "used_az" {
    value = "${aws_subnet.public.*.availability_zone}"
}

output "igw-id" {
  value = "${aws_internet_gateway.primary.id}"
}

output "ngw-id" {
  value = "${aws_nat_gateway.nat.id}"
}