output repository_arn {
  value       = aws_ecr_repository.gatus_repo.arn
}

output "repository_url" {
  value       = aws_ecr_repository.gatus_repo.repository_url
}

output "repository_name" {
  value       = aws_ecr_repository.gatus_repo.name
}




