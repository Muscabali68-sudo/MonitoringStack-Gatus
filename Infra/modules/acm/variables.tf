variable "domain_name" {
  description = "Domain name for the ACM certificate"
  type        = string
}


variable "hosted_zone_name" {
  type        = string
  description = "description"
}

variable "certificate_name" {
  description = "Name tag applied to the ACM certificate"
  type        = string
}

variable "validation_method" {
  description = "Method used to validate the ACM certificate"
  type        = string
}

variable "validation_record_ttl" {
  description = "TTL for the ACM validation DNS record"
  type        = number
} 