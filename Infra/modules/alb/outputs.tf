output "tg_arn" {
  value = aws_lb_target_group.gatus_tg.arn
}

output "alb_hosted_zone_id" {
  value = aws_alb.gatus_alb.zone_id
}

output "alb_dns_name" {
  value = aws_alb.gatus_alb.dns_name
}

output "alb_arn" {
  value = aws_alb.gatus_alb.arn
}

