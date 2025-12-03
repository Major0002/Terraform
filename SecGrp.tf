resource "aws_security_group" "major_sg" {
  name        = "major-sg"
  description = "major-sg"

  tags = {
    Name = "major-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sshfromMYIP" {
  security_group_id = aws_security_group.major_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "AllowHTTP" {
  security_group_id = aws_security_group.major_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.major_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.major_sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1"
}
