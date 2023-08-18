resource "aws_vpc" "vpc1" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "myfirstvpc"
  }
}
resource "aws_subnet" "mysubnet" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = var.sub_cidr_block
  map_public_ip_on_launch = false

  tags = {
    Name = "myfirstsubnet"
  }
}

