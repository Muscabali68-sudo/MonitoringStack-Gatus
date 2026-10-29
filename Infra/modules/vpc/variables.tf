variable "vpc_name" {
  type        = string
  description = "Name tag applied to the VPC"
}

variable "cidr_block" {
  type        = string
  description = "CIDR block for VPC"
}



variable "dns_support" {
  type        = bool
  description = "Enable DNS support inside the VPC"
}

variable "dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames inside the VPC"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
  default     = ["10.0.4.0/24", "10.0.5.0/24"]
}


variable "azs" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["eu-central-1a", "eu-central-1b"]
}

variable "internet_gateway_name" {
  type        = string
  description = "Internet gateway"
}


variable "nat_gateway_name" {
  type        = string
  description = "Name of the natgateway"
}


variable "availability_mode" {
  type        = string
  description = "Regional natgateway"
}

variable "public_route_cidr_block" {
  type        = string
  description = "Name of the public route table"
}

variable "public_route_table_name" {
  type        = string
  description = "Destination CIDR block public"
}


variable "private_route_cidr_block" {
  type        = string
  description = "Destination CIDR block private"
}

variable "private_route_table_name" {
  type        = string
  description = "Name of the private route table"
}

variable "connectivity_type" {
  description = "Connectivity type of the NAT Gateway"
  type        = string

}
