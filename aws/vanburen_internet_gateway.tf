//Internet gateway for the public subnet
resource "aws_internet_gateway" "vanburen_gateway" {
  vpc_id = aws_vpc.vanburen_default.id
  tags = {
    Name = "vanburen_gateway"
  }
}
