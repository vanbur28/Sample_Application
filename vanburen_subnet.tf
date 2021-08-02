/*==== Subnets ======*/
/* Private subnet */
resource "aws_subnet" "vanburen_private_subnet" {
  count = length(var.vanburen_private_subnet_cidr_blocks)

  vpc_id            = aws_vpc.vanburen_default.id
  cidr_block        = var.vanburen_private_subnet_cidr_blocks[count.index]
  availability_zone = var.vanburen_availability_zones[count.index]
}

/* Public subnet */
resource "aws_subnet" "vanburen_public_subnet" {
  count = length(var.vanburen_public_subnet_cidr_blocks)

  vpc_id                  = aws_vpc.vanburen_default.id
  cidr_block              = var.vanburen_public_subnet_cidr_blocks[count.index]
  availability_zone       = var.vanburen_availability_zones[count.index]
  map_public_ip_on_launch = true
}


