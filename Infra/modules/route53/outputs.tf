output "hosted_zone_id" {
  description = "ID of the Route 53 hosted zone"
  value       = data.aws_route53_zone.gatus.zone_id
} 