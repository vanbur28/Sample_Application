variable "vanburen_aws_region" {    
    default = "us-west-1"
}

variable "vanburen_instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "vanburen_instance"
}

variable "vanburen_cidr_block" {
    default = "true"
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