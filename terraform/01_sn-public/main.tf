data "aws_availability_zones" "available" {}

## Primary Public subnet
resource "aws_subnet" "public" {
  count                     = "2"
  vpc_id                    = var.vpc_id
  cidr_block                = "10.0.${count.index}.0/27"
  availability_zone         = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch   = true

  tags  = {
    Name = format("%s%s","public-sn_", split("-", element(data.aws_availability_zones.available.names, count.index))[2])
  }
}