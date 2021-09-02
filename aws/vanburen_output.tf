// ==== Outputs ======
output "vanburen_id" {
  value       = aws_vpc.vanburen_default.id
  description = "VPC ID"
}
output "vanburen_public_subnet_1_ids" {
  value       = aws_subnet.vanburen_public_subnet_1.*.id
  description = "List of public subnet IDs"
}
output "vanburen_public_subnet_2_ids" {
  value       = aws_subnet.vanburen_public_subnet_2.*.id
  description = "List of public subnet IDs"
}
output "vanburen_private_subnet_1_ids" {
  value       = aws_subnet.vanburen_private_subnet_1.*.id
  description = "List of private subnet IDs"
}
output "vanburen_private_subnet_2_ids" {
  value       = aws_subnet.vanburen_private_subnet_2.*.id
  description = "List of private subnet IDs"
}
output "vanburen_cidr_block" {
  value       = var.vanburen_cidr_block
  description = "The CIDR block associated with the VPC"
}
output "nat_gateway_ips" {
  value       = aws_eip.vanburen_eip.*.public_ip
  description = "List of Elastic IPs associated with NAT gateways"
}
