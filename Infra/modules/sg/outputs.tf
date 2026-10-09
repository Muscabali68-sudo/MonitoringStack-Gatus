output "alb_sg_id" {
  value       = aws_security_group.alb.id
  description = "ID of the ALB security group"
}

output "ecs_sg_id" {
  value       = aws_security_group.ecs_task.id
  description = ID of the ECS task security group

}

output "efs_sg_id" {
  value       = aws_security_group.efs.id
  description = ID of the EFS security group
} 