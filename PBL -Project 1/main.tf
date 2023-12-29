# Get the list of availability zones
data "aws_availability_zones" "available" {
state = "available" 
}

provider "aws" {
  region = var.region
}

# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}

# Creating public subnets
resource "aws_subnet" "public" {
  count = var.preferred_number_of_public_subnets == null ? lenght(data.aws_availability_zones.available.names) : var.preferred_number_of_public_subnets
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet(var.vpc_cidr, 4 , count.index)
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available.names[count.index]

  
}
