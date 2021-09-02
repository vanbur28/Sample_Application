resource "aws_key_pair" "vanburen_aws_keypair" {
  key_name   = var.vanburen2021_keyname
  public_key = var.vanburen_public_key_pair
}
