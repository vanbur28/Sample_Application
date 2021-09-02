//==== Routing Tables ======
// Routing table for private subnets 
resource "aws_route_table" "vanburen_public_routing_table" {
  vpc_id = aws_vpc.vanburen_default.id
  route {
    cidr_block = var.vanburen_destination_cidr_block
    gateway_id = aws_internet_gateway.vanburen_gateway.id
  }
  tags = {
    Name = "vanburen_public_routing_table"
  }
}
// Routing table for private subnets 
resource "aws_route_table" "vanburen_private_routing_table" {
  vpc_id = aws_vpc.vanburen_default.id
  route {
    cidr_block = var.vanburen_destination_cidr_block
    gateway_id = aws_nat_gateway.vanburen_nat.id
  }
  tags = {
    Name = "vanburen_public_routing_table"
  }
}
// Route Table Association 
resource "aws_route_table_association" "vanburen_public_subnet_1_routing_table" {
  subnet_id      = aws_subnet.vanburen_public_subnet_1.id
  route_table_id = aws_route_table.vanburen_public_routing_table.id
}
resource "aws_route_table_association" "vanburen_public_subnet_2_routing_table" {
  subnet_id      = aws_subnet.vanburen_public_subnet_2.id
  route_table_id = aws_route_table.vanburen_public_routing_table.id
}
resource "aws_route_table_association" "vanburen_private_subnet_1_routing_table" {
  subnet_id      = aws_subnet.vanburen_private_subnet_1.id
  route_table_id = aws_route_table.vanburen_private_routing_table.id
}
resource "aws_route_table_association" "vanburen_private_subnet_2_routing_table" {
  subnet_id      = aws_subnet.vanburen_private_subnet_2.id
  route_table_id = aws_route_table.vanburen_private_routing_table.id
}
