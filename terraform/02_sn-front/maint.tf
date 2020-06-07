##  Private subnets for the frontEnd (WP)
resource "aws_subnet" "front" {
  count                     = "2"
  vpc_id                    = var.vpc_id
  cidr_block                = "10.0.${count.index}.32/27"
  availability_zone         = element(var.list-region, count.index)

  tags  = {
    Name    = format("%s%s","front-sn_",split("-", element(var.list-region, count.index))[2])
  }
}