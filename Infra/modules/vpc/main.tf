resource "aws_vpc" "gatus" {
 cidr_block = var.cidr_block
#  "10.0.0.0/16"
 
 tags = {
   Name = var.vpc_name
 }

resource "aws_subnet" "public_subnets" {
 count      = length(var.public_subnet_cidrs)
 vpc_id     = aws_vpc.gatus.id
 cidr_block = element(var.public_subnet_cidrs, count.index)
 availability_zone = element(var.azs, count.index)
 tags = {
   Name = "Public Subnet ${count.index + 1}"
 }
 }
 
resource "aws_subnet" "private_subnets" {
 count      = length(var.private_subnet_cidrs)
 vpc_id     = aws_vpc.gatus.id
 cidr_block = element(var.private_subnet_cidrs, count.index)
 availability_zone = element(var.azs, count.index)

 tags = {
   Name = "Private Subnet ${count.index + 1}"
 }
} 

resource "aws_internet_gateway" "gatus_igw" {
 vpc_id = aws_vpc.gatus.id
 
 tags = {
   Name = var.internet_gateway_name
 }
}

resource "aws_nat_gateway" "gatus_nat_igw" {
  vpc_id            = aws_vpc.gatus.id
  availability_mode = var.availability_mode 

 tags = {
    Name = var.nat_gateway_name
  }
}


resource "aws_route_table" "public_rt" {
 vpc_id = aws_vpc.gatus.id
 
 route {
   cidr_block = var.public_route_cidr_block
   gateway_id = aws_internet_gateway.gatus_igw.id
 }
 
 tags = {
   Name = var.public_route_table_name
 }
}

resource "aws_route_table_association" "public_subnet_asso" {
 count = length(var.public_subnet_cidrs)
 subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
 route_table_id = aws_route_table.public_rt.id
}


resource "aws_route_table" "private_rt" {
 vpc_id = aws_vpc.gatus.id

 route {
    cidir_block   = var.private_route_cidr_block
    natgateway_id = aws.natgateway.gatus_nat_igw.id
 }

 name_tag {
    name = var.private_route_table_name
 }

resource "aws_route_table_association" "public_subnet_asso" {
 count = length(var.private_subnet_cidrs)
 subnet_id      = element(aws_subnet.private_subnets[*].id, count.index)
 route_table_id = aws_route_table.private_rt.id
}

