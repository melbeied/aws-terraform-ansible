output "region-list" {
  value = "${module.public-subnet.used_az}"
}

output "vpc-id" {
  value = "${module.vpc.id}"
}
output "natgw-id" {
  value = "${module.public-subnet.ngw-id}"
}

// output "cidrs-sn-public" {
//   value = "${module.vpc.*.cidrs}"
// }


output "sg-public-id" {
  value = "${module.compute.sg-public-id}"
}

output "sg-front-id" {
  value = "${module.compute.sg-front-id}"
}

output "sg-back-id" {
  value = "${module.compute.sg-back-id}"
}


