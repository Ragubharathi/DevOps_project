resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.tags}-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "${var.tags}-igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${var.tags}-publick_rt"
  }
}

resource "aws_subnet" "public_sub" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = var.pub_sub
  map_public_ip_on_launch = true
  availability_zone = var.AZ1
  tags = {
    Name = "${var.tags}-public_sub"
  }
}

resource "aws_route_table_association" "public_assoc_1" {
  subnet_id = aws_subnet.public_sub.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id = aws_subnet.public_sub.id
  tags = {
    Name = "${var.tags}-natgatway"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  tags = {
    Name = "${var.tags}-private_rt"
  }
}

resource "aws_subnet" "private_sub" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = var.pri_sub
  availability_zone = var.AZ2
  tags = {
    Name = "${var.tags}-private_sub"
  }
}

resource "aws_route_table_association" "private_assoc_1" {
  subnet_id = aws_subnet.private_sub.id
  route_table_id = aws_route_table.private_rt.id
}
