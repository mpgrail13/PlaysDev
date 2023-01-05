resource "aws_vpc" "task13-vpc" {
  cidr_block = var.vpc_cidr
  
  tags       = {
    Name     = "task13-vpc"
  }
}

resource "aws_subnet" "public_subnets" {
  count = length(var.public_subnet_cidrs)
  vpc_id = aws_vpc.task13-vpc.id
  cidr_block = element(var.public_subnet_cidrs, count.index)
  map_public_ip_on_launch = "true"
  availability_zone = element(var.az, count.index) 
  
  tags = {
    Name = "task13-sub-pub-${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnets" {
  count = length(var.private_subnet_cidrs)
  vpc_id = aws_vpc.task13-vpc.id
  cidr_block = element(var.private_subnet_cidrs, count.index)
  availability_zone = element(var.az, count.index)

  tags = {
    Name = "task13-sub-pr-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "task13-igw" {
  vpc_id = aws_vpc.task13-vpc.id
  
  tags = {
    Name = "task13-igw"
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.task13-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.task13-igw.id
  }

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "public-routes" {
  count = length(var.public_subnet_cidrs)
  subnet_id = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_eip" "nat" {
  count = length(var.private_subnet_cidrs)
  vpc = true
  tags = {
    Name = "eip-nat-gw-${count.index + 1}"
  }
}

resource "aws_nat_gateway" "nat" {
  count = length(var.private_subnet_cidrs)
  allocation_id = aws_eip.nat[count.index].id
  subnet_id = element(aws_subnet.public_subnets[*].id, count.index)
  tags = {
    Name = "nat-gw-${count.index + 1}"
  }
}

resource "aws_route_table" "private-rt" {
  count = length(var.private_subnet_cidrs)
  vpc_id = aws_vpc.task13-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat[count.index].id
  }
  tags = {
    Name = "private-rt"
  }
}

resource "aws_route_table_association" "private-routes" {
  count = length(aws_subnet.private_subnets[*].id)
  route_table_id = aws_route_table.private-rt[count.index].id
  subnet_id = element(aws_subnet.private_subnets[*].id, count.index)
}
