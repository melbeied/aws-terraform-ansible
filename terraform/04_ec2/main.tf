module "sg" {
    source = "./040_sg"
    vpc_id      = var.vpc_id
    vpc_cidr    = var.vpc_cidr
}