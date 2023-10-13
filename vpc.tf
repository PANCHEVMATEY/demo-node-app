resource "aws_vpc" "app-VPC" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "app-VPC"
  }
}