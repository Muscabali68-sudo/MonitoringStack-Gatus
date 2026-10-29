output "task_definition_family" {
  description = "Task definition family name"
  value       = aws_ecs_task_definition.gatus.family
}

output "task_definition_arn" {
  description = "Task definition ARN"
  value       = aws_ecs_task_definition.gatus.arn
}