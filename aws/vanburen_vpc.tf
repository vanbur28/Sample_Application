/*==== The VPC ======*/
# Example developed from linked file:
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
# https://github.com/azavea/terraform-aws-vpc
resource "aws_vpc" "vanburen_default" {
  cidr_block           = var.vanburen_cidr_block
  enable_dns_support   = var.vanburen_enable_dns_support   #gives you an internal domain name
  enable_dns_hostnames = var.vanburen_enable_dns_hostnames #gives you an internal host name
}

