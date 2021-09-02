//Elastic IP for NAT - Provides a resource to create a VPC NAT Gateway
resource "aws_nat_gateway" "vanburen_nat" {
  allocation_id = aws_eip.vanburen_eip.id
  subnet_id     = aws_subnet.vanburen_public_subnet_1.id
  tags = {
    Name = "vanburen_nat"
  }
  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.vanburen_gateway]
}
