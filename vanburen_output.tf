/*==== Outputs ======*/
output "vanburen_id" {
  value       = aws_vpc.vanburen_default.id
  description = "VPC ID"
}

output "vanburen_public_subnet_ids" {
  value       = aws_subnet.vanburen_public_subnet.*.id
  description = "List of public subnet IDs"
}

output "vanburen_private_subnet_ids" {
  value       = aws_subnet.vanburen_private_subnet.*.id
  description = "List of private subnet IDs"
}

output "bastion_hostname" {
  value       = aws_instance.vanburen_bastion.vanburen_public_dns
  description = "Public DNS name for bastion instance"
}

output "bastion_security_group_id" {
  value       = aws_security_group.vanburen_bastion.id
  description = "Security group ID tied to bastion instance"
}

output "bastion_network_interface_id" {
  value       = aws_instance.vanburen_bastion.vanburen_primary_network_interface_id
  description = "Elastic Network Interface (ENI) ID of the Bastion instance's primary network interface"
}

output "cidr_block" {
  value       = var.vanburen_cidr_block
  description = "The CIDR block associated with the VPC"
}

output "nat_gateway_ips" {
  value       = aws_eip.vanburen_nat.*.vanburen_public_ip
  description = "List of Elastic IPs associated with NAT gateways"
}
