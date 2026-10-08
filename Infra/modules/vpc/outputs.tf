output "vpc_id" {
  description = "ID of the Gatus VPC"
  value       = aws_vpc.gatus.id
}

output public_subnets_ids {
  value       = aws_subnet.public_subnets[*].id
  description = "IDs of all Public Subnets"
}

output private_subnets_id {
  value       = aws_subnet.private_subnets[*].id
  description = "IDs of all Private Subnets"
}