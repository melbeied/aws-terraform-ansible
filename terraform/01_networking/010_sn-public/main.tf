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

## Internet geteway : creation
resource "aws_internet_gateway" "primary" {
  vpc_id = var.vpc_id
  tags  = {
    Name = "primary-igw"
  }
 }


# Route table: attach Internet Gateway 
resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.primary.id
  }
  tags  = {
    Name = "publicRouteTable"
  }
}

# Route table : association with public subnets
resource "aws_route_table_association" "a" {
  count = "2"
  subnet_id      = element("${aws_subnet.public.*.id}", count.index)
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_eip" "nat_eip" {
  vpc = true
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = element("${aws_subnet.public.*.id}", 0)
}