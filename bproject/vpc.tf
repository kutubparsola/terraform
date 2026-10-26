resource "aws_vpc" "ofvpc" {
  cidr_block = var.cidr
}

resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.ofvpc.id
  availability_zone       = "us-east-1a"
  cidr_block              = var.sub1cidr
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet2" {
  vpc_id                  = aws_vpc.ofvpc.id
  cidr_block              = var.sub2cidr
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.ofvpc.id
}

resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.ofvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.RT.id
}

resource "aws_route_table_association" "rta2" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.RT.id
}
