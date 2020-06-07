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
    source = "./01_sn-public"
    vpc_id      = module.vpc.id
}
module "front-subnet" {
    source = "./02_sn-front"
    vpc_id      = module.vpc.id
    list-region = module.public-subnet.used_az
    nat-gw-id   = module.public-subnet.ngw-id
}
module "back-subnet" {
    source = "./03_sn-back"
    vpc_id      = module.vpc.id
    list-region = module.public-subnet.used_az
    nat-gw-id   = module.public-subnet.ngw-id
}

# module "networking" {
#     source = "./04_network"
#     vpc_id      = module.vpc.id
#     public-subnet_ids = module.public-subnet.ids
# }