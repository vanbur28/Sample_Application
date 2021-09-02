//Resources used:
//https://www.linkedin.com/pulse/creating-infrastructure-aws-custom-vpc-subnet-nat-gateway-agarwal/?trk=public_profile_article_view
resource "aws_instance" "vanburen_bastion_host" {
  ami                         = var.vanburen_ami_instance_1
  instance_type               = var.vanburen_instance_type_ec2_1
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.vanburen_public_subnet_1.id
  vpc_security_group_ids      = [aws_security_group.vanburen_pub-ssh-sg.id]
  key_name                    = aws_key_pair.vanburen_aws_keypair.key_name
  root_block_device {
    volume_size = var.vanburen_volume_size_ec2_1
  }
  tags = {
    Name = "vanburen_bastion"
  }
}
resource "aws_instance" "vanburen_application_server" {
  ami                    = var.vanburen_ami_instance_2
  instance_type          = var.vanburen_instance_type_ec2_2
  subnet_id              = aws_subnet.vanburen_private_subnet_1.id
  vpc_security_group_ids = [aws_security_group.vanburen_prv-ssh-sg.id]
  key_name               = aws_key_pair.vanburen_aws_keypair.key_name
  root_block_device {
    volume_size = var.vanburen_volume_size_ec2_2
  }
  tags = {
    Name = "vanburen_application"
  }
}
