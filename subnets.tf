resource "aws_subnet" "my-app-subnet-1" {
  vpc_id            = aws_vpc.app-VPC.id
  cidr_block        = var.subnet1_cidr_block
  availability_zone = var.subnets_availability_zone.availability_1a

  tags = {
    Name = "my-app-subnet-1"
  }
}

resource "aws_subnet" "my-app-subnet-2" {
  vpc_id            = aws_vpc.app-VPC.id
  cidr_block        = var.subnet2_cidr_block
  availability_zone = var.subnets_availability_zone.availability_1b
  tags = {
    Name = "my-app-subnet-2"
  }
}