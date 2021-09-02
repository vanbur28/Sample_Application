variable "vanburen_name" {
  default     = "Default"
  type        = string
  description = "Name of the VPC"
}
variable "vanburen_az_1" {
  type        = string
  description = "Region of the VPC"
}
variable "vanburen_az_2" {
  type        = string
  description = "Region of the VPC"
}
variable "vanburen_instance" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "vanburen_instance"
}
variable "vanburen_enable_dns_support" {
  default = "true"
}
variable "vanburen_enable_dns_hostnames" {
  default = "true"
}
variable "vanburen_local_public_ip" {
  type        = string
  description = "Local public IP adress"
}
variable "vanburen_public_subnet_1_cidr" {
  type        = string
  description = "List of public subnet CIDR blocks"
}
variable "vanburen_public_subnet_2_cidr" {
  type        = string
  description = "List of public subnet CIDR blocks"
}
variable "vanburen_private_subnet_1_cidr" {
  type        = string
  description = "List of private subnet CIDR blocks"
}
variable "vanburen_private_subnet_2_cidr" {
  type        = string
  description = "List of private subnet CIDR blocks"
}
variable "vanburen_cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}
variable "vanburen_destination_cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}
variable "vanburen_ami_instance_1" {
  type = string
}
variable "vanburen_ami_instance_2" {
  type = string
}
variable "vanburen_volume_size_ec2_1" {
  type = string
}
variable "vanburen_volume_size_ec2_2" {
  type = string
}
variable "vanburen_instance_type_ec2_1" {
  type = string
}
variable "vanburen_instance_type_ec2_2" {
  type = string
}
variable "vanburen_public_key_pair" {
  type = string
}
variable "vanburen2021_keyname" {
  type = string
}
variable "vanburen_tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the VPC resources"
}
