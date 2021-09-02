//Resources used for development
//https://github.com/joshuamkite/terraform-aws-ssh-bastion-service/blob/master/security_group.tf
//https://www.linkedin.com/pulse/creating-infrastructure-aws-custom-vpc-subnet-nat-gateway-agarwal/?trk=public_profile_article_view
//https://github.com/hashicorp/terraform-provider-aws/issues/10181
//Bastion host
resource "aws_security_group" "vanburen_pub-ssh-sg" {
  name        = "vanburen_pub-ssh-sg"
  description = "Bastion host"
  vpc_id      = aws_vpc.vanburen_default.id
  ingress {
    description = "Connection from local IP of VanBuren"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.vanburen_local_public_ip]
  }
  ingress {
    description = "Jenkins connection"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.vanburen_local_public_ip]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Bastion_Host"
  }
}
resource "aws_security_group" "vanburen_prv-ssh-sg" {
  name        = "vanburen_prv-ssh-sg"
  description = "Application Security Group"
  vpc_id      = aws_vpc.vanburen_default.id
  ingress {
    description     = "Connection to same port with application from the public subnets"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.vanburen_pub-ssh-sg.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Application_Security_Group"
  }
}

resource "aws_security_group" "vanburen_pub-http-sg" {
  description = "HTTP and HTTPS access"
  name        = "vanburen_pub-http-sg"
  vpc_id      = aws_vpc.vanburen_default.id
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.vanburen_local_public_ip]
  }
  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.vanburen_local_public_ip]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


