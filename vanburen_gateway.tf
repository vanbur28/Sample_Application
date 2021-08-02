/*==== Gateway ======*/
/* Internet gateway for the public subnet */
resource "aws_internet_gateway" "vanburen_default" {
  vpc_id = aws_vpc.vanburen_default.id
}

/* Elastic IP for NAT */
resource "aws_eip" "vanburen_nat_eip" {
  vpc        = true
  depends_on = [vanburen_aws_internet_gateway.ig]
}

/* NAT */
resource "aws_nat_gateway" "vanburen_nat" {
  allocation_id = aws_eip.vanburen_nat_eip.id
  subnet_id     = element(aws_subnet.vanburen_public_subnet.*.id, 0)
  depends_on    = [aws_internet_gateway.ig]
}
