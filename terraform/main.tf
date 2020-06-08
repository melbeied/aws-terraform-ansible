###############################################################################
# Provider
###############################################################################
provider "aws" {
  region     = var.vpc_region
}

###############################################################################
# Base Network
###############################################################################

module "vpc" {
  source = "./00_vpc"

  vpc_region     = var.vpc_region
  vpc_name       = var.vpc_name
  vpc_cidr_block = var.vpc_cidr_block
}

module "public-subnet" {
    source = "./01_networking/010_sn-public"
    vpc_id      = module.vpc.id
}
module "front-subnet" {
    source = "./01_networking/011_sn-front"
    vpc_id      = module.vpc.id
    list-region = module.public-subnet.used_az
    nat-gw-id   = module.public-subnet.ngw-id
}
module "back-subnet" {
    source = "./01_networking/012_sn-back"
    vpc_id      = module.vpc.id
    list-region = module.public-subnet.used_az
    nat-gw-id   = module.public-subnet.ngw-id
}
# module "storage" {
#     source = "./02_storage"
#     vpc_id      = module.vpc.id
# }
module "compute" {
    source = "./03_compute"
    vpc_id          = module.vpc.id
    vpc_cidr        = module.vpc.cidr
    aws_key_name    = var.aws_key_name
    sn-public-list  = module.public-subnet.public-sn-ids
}