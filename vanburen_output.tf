output "vanburen_instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.vanburen_1_server.id
}

output "vanburen_instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.vanburen_1_server.public_ip
}