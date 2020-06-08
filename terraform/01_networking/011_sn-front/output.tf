output "front-sn-ids" {
  value = "${aws_subnet.front.*.id}"
}