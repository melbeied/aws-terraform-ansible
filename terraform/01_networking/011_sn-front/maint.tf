##  Private subnets for the frontEnd (WP)
resource "aws_subnet" "front" {
  count                     = length(var.list-region)
  vpc_id                    = var.vpc_id
  cidr_block                = "10.0.${count.index}.32/27"
  availability_zone         = element(var.list-region, count.index)
  map_public_ip_on_launch   = false

  tags  = {
    Name    = format("%s%s","front-sn_",split("-", element(var.list-region, count.index))[2])
  }
}


resource "aws_route_table" "front_routetable" {
  vpc_id = var.vpc_id
  tags = {
    Name = "rt-front"
  }
}

resource "aws_route" "nat_route" {
  route_table_id         = aws_route_table.front_routetable.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.nat-gw-id
  
}

resource "aws_route_table_association" "front_subnet" {
  count           = length(aws_subnet.front.*.id)
  subnet_id       = element(aws_subnet.front.*.id, count.index)
  route_table_id  = aws_route_table.front_routetable.id
}