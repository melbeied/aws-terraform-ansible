output "region-list" {
  value = "${module.public-subnet.used_az}"
}

output "vpc-id" {
  value = "${module.vpc.id}"
}