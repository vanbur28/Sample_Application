//==== Subnets ======
// Public subnet 
resource "aws_subnet" "vanburen_public_subnet_1" {
  vpc_id                  = aws_vpc.vanburen_default.id
  cidr_block              = var.vanburen_public_subnet_1_cidr
  availability_zone       = var.vanburen_az_1
  map_public_ip_on_launch = true
}
resource "aws_subnet" "vanburen_public_subnet_2" {
  vpc_id                  = aws_vpc.vanburen_default.id
  cidr_block              = var.vanburen_public_subnet_2_cidr
  availability_zone       = var.vanburen_az_2
  map_public_ip_on_launch = true
}
// Private subnet
resource "aws_subnet" "vanburen_private_subnet_1" {
  vpc_id                  = aws_vpc.vanburen_default.id
  cidr_block              = var.vanburen_private_subnet_1_cidr
  availability_zone       = var.vanburen_az_1
  map_public_ip_on_launch = false
}
resource "aws_subnet" "vanburen_private_subnet_2" {
  vpc_id                  = aws_vpc.vanburen_default.id
  cidr_block              = var.vanburen_private_subnet_2_cidr
  availability_zone       = var.vanburen_az_2
  map_public_ip_on_launch = false
}
