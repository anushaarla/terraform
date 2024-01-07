resource "aws_subnet" "public-sub" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = var.subnet-cidr

  tags = {
    Name = "public-sub"
  }
}