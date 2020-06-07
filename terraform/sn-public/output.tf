output "public-subnet_ids" {
  value = ["${aws_subnet.public.*.id}"]
}

output "used_az" {
    value = "${aws_subnet.public.*.availability_zone}"
}