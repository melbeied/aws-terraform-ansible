output "region-list" {
  value = "${module.public-subnet.used_az}"
}

output "vpc-id" {
  value = "${module.vpc.id}"
}

output "sg-public-id" {
  value = "${module.ec2.sg-public-ids}"
}

output "sg-front-id" {
  value = "${module.ec2.sg-front-ids}"
}

output "sg-back-id" {
  value = "${module.ec2.sg-back-ids}"
}