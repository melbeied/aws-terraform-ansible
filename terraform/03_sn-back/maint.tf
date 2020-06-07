##  Private subnets for the backEnd (DataBase)
resource "aws_subnet" "back" {
  count                     = "2"
  vpc_id                    = var.vpc_id
  cidr_block                = "10.0.${count.index}.64/27"
  availability_zone         = element(var.list-region, count.index)

  tags  = {
    Name    = format("%s%s","back-sn_",split("-", element(var.list-region, count.index))[2])
  }
}