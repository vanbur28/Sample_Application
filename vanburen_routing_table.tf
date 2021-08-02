/*==== Routing Tables ======*/
/* Routing table for private subnets */
resource "aws_route_table" "vanburen_private" {
  count  = length(var.vanburen_private_subnet_cidr_blocks)
  vpc_id = aws_vpc.vanburen_default.id
}

resource "aws_route" "vanburen_private" {
  count = length(var.vanburen_private_subnet_cidr_blocks)

  route_table_id         = aws_route_table.vanburen_private[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.vanburen_default[count.index].id
}

/* Routing table for public subnets */
resource "aws_route_table" "vanburen_public" {
  vpc_id = aws_vpc.vanburen_default.id
}

resource "aws_route" "vanburen_public" {
  route_table_id         = aws_route_table.vanburen_public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vanburen_default.id
}

resource "aws_route_table_association" "vanburen_private" {
  count = length(var.vanburen_rivate_subnet_cidr_blocks)

  subnet_id      = aws_subnet.vanburen_private[count.index].id
  route_table_id = aws_route_table.vanburen_private[count.index].id
}

resource "aws_route_table_association" "vanburen_public" {
  count = length(var.vanburen_public_subnet_cidr_blocks)

  subnet_id      = aws_subnet.vanburen_public[count.index].id
  route_table_id = aws_route_table.vanburen_public.id
}
