variable "vanburen_name" {
  default     = "Default"
  type        = string
  description = "Name of the VPC"
}

variable "vanburen_project" {
  type        = string
  description = "Name of project this VPC is meant to house"
}

variable "vanbruen_environment" {
  type        = string
  description = "Name of environment this VPC is targeting"
}

variable "vanburen-region" {
  default     = "us-west-1"
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

variable "vanburen_enable_classiclink" {
  default = "false"
}

variable "vanburen_instance_tenancy" {
  default = "true"
}

variable "vanburen_public_subnet_cidr_blocks" {
  default     = ["10.0.0.0/24", "10.0.2.0/24"]
  type        = list(any)
  description = "List of public subnet CIDR blocks"
}

variable "vanburen_private_subnet_cidr_blocks" {
  default     = ["10.0.1.0/24", "10.0.3.0/24"]
  type        = list(any)
  description = "List of private subnet CIDR blocks"
}

variable "vanburen_key_name" {
  type        = string
  description = "EC2 Key pair name for the bastion"
}

variable "vanburen_cidr_block" {
  default     = "10.0.0.0/16"
  type        = string
  description = "CIDR block for the VPC"
}

variable "vanburen_public_subnet_cidr_blocks" {
  default     = ["10.0.0.0/24", "10.0.2.0/24"]
  type        = list(any)
  description = "List of public subnet CIDR blocks"
}

variable "vanburen_private_subnet_cidr_blocks" {
  default     = ["10.0.1.0/24", "10.0.3.0/24"]
  type        = list(any)
  description = "List of private subnet CIDR blocks"
}

variable "vanburen_availability_zones" {
  default     = ["us-west-1a", "us-west-1b"]
  type        = list(any)
  description = "List of availability zones"
}

variable "vanburen_bastion_ami" {
  type        = string
  description = "Bastion Amazon Machine Image (AMI) ID"
}

variable "vanburen_bastion_ebs_optimized" {
  default     = false
  type        = bool
  description = "If true, the bastion instance will be EBS-optimized"
}

variable "vanburen_bastion_instance_type" {
  default     = "t2.small"
  type        = string
  description = "Instance type for bastion instance"
}

variable "vanburen_tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the VPC resources"
}
