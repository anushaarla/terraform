resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.public-sub.id
  vpc_security_group_ids      = [aws_security_group.allow_all.id]
  associate_public_ip_address = true
  tags = {
    Name       = var.server_name
  }
}


 