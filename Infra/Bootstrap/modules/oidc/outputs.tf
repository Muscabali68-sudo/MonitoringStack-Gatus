output "build_push_role_arn" {
  value = aws_iam_role.build_push.arn
}

output "terrafrom_deployment_role_arn" {
  value = aws_iam_role.terrafrom_deployment.arn
}

