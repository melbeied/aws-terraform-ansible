##  Private subnets for the backEnd (DataBase)
resource "aws_subnet" "back" {
  count                     = length(var.list-region)
  vpc_id                    = var.vpc_id
  cidr_block                = "10.0.${count.index}.64/27"
  availability_zone         = element(var.list-region, count.index)
  map_public_ip_on_launch   = false

  tags  = {
    Name    = format("%s%s","back-sn_",split("-", element(var.list-region, count.index))[2])
  }
}


resource "aws_route_table" "back_routetable" {
  vpc_id = var.vpc_id
  tags = {
    Name = "rt-back"
  }
}


// to activate
resource "aws_route" "nat_route" {
  route_table_id         = aws_route_table.back_routetable.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.nat-gw-id
}

resource "aws_route_table_association" "back_subnets" {
  count           = length(aws_subnet.back.*.id)
  subnet_id       = element(aws_subnet.back.*.id, count.index)
  route_table_id  = aws_route_table.back_routetable.id
}