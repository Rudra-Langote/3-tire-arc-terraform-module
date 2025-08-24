resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "my_costom_vpc"
  }
}

resource "aws_internet_gateway" "my_igw" {
    vpc_id = aws_vpc.my_vpc.id
    tags = {
        Name = "my_costom_igw"
    }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.0.0/20"
  availability_zone = "us-east-1a"
  tags = {
    Name = "my_costom_public_subnet"
  }
  
}

resource "aws_subnet" "private_subnet-1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.16.0/20"
  availability_zone = "us-east-1b"
    tags = {
        Name = "my_costom_private_subnet-1"
    }
}

resource "aws_subnet" "private_subnet-2" {
    vpc_id            = aws_vpc.my_vpc.id
    cidr_block        = "10.0.32.0/20"
    availability_zone = "us-east-1c"
    tags = {
      Name = "my_costom_private_subnet-2" 
    }
}


resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "my_costom_public_route_table"
  }
}

resource "aws_route_table_association" "public_route_table_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id 
}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_igw.id
}  


output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
  
}

output "private_subnet-1_id" {
  value = aws_subnet.private_subnet-1.id
}
output "private_subnet-2_id" {
  value = aws_subnet.private_subnet-2.id
  
}