resource "aws_route_table_association" "rt-assoc" {
  subnet_id      = aws_subnet.public-sub.id
  route_table_id = aws_route_table.public-rt.id
}