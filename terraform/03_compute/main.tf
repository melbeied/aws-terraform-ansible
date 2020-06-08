module "sg" {
    source          = "./030_sg"
    vpc_id          = var.vpc_id
    vpc_cidr        = var.vpc_cidr
}
module "ec2" {
    source          = "./031_ec2"
    vpc_id          = var.vpc_id
    aws_key_name    = var.aws_key_name
    sg-public-id    = module.sg.sg-public-id
    sn-public-list  = var.sn-public-list
}