// EIP - Provides an Elastic IP resource
resource "aws_eip" "vanburen_eip" {
  //instance = aws_instance.web.id
  vpc = true
}
