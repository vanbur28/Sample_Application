## Example developed from linked file:
## https://registry.terraform.io/providers/hashicorp/aws/latest/docs
terraform{
    required_version = "= 1.0.3"
    required_providers {
        aws {
            source = "hashicorp/aws"
            version = "~> 3.0"
        }    
    }
}
# Configure the AWS Provider
provider {
    region = var.vanburen_aws_region
    awsID       : ${{secrets.AWS_ID}}
    awskey      : ${{secrets.AWS_SAK}}
}

resource "aws_instance" "vanburen_1_server" {
    ami             = "ami-0d382e80be7ffdae5"
    instance_type   = "t2.small"
    tags = { var.vanburen_instance
    }
}

resource “aws_vpc” “prod-vpc” {
    cidr_block = “10.0.0.0/16”
    enable_dns_support = var.vanburen_instance_tenancy #gives you an internal domain name
    enable_dns_hostnames = var.vanburen_instance_tenancy #gives you an internal host name
    enable_classiclink = var.vanburen_enable_classiclink
    instance_tenancy = var.vanburen_instance_tenancy
}
