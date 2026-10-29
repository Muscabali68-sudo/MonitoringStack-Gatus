#Vpc module call

module "vpc" {
  source = "./modules/vpc"

  cidr_block            = var.cidr_block
  vpc_name              = var.vpc_name
  dns_support           = var.dns_support
  dns_hostnames         = var.dns_hostnames
  internet_gateway_name = var.internet_gateway_name
  availability_mode     = var.availability_mode
  connectivity_type     = var.connectivity_type
  nat_gateway_name      = var.nat_gateway_name

  public_route_cidr_block = var.public_route_cidr_block
  public_subnet_cidrs     = var.public_subnet_cidrs
  public_route_table_name = var.public_route_table_name

  private_route_cidr_block = var.private_route_cidr_block
  private_subnet_cidrs     = var.private_subnet_cidrs
  private_route_table_name = var.private_route_table_name
}


#sg module cal

module "sg" {
 source = "./modules/sg"



  vpc_id = module.vpc.vpc_id


  alb_sg_name        = var.alb_sg_name
  alb_sg_description = var.alb_sg_description
  alb_ingress_cidr   = var.alb_ingress_cidr

  http_port        = var.http_port
  tcp_protocol     = var.tcp_protocol
  https_port       = var.https_port
  application_port = var.application_port

  ecs_sg_name        = var.ecs_sg_name
  ecs_sg_description = var.ecs_sg_description
  ip-protocol-1      = var.ip-protocol-1 
  ecs_outbound_cidr  = var.ecs_outbound_cidr


  efs_sg_name        = var.efs_sg_name
  efs_port           = var.efs_port
  efs_sg_description = var.efs_sg_description
}
#Alb module call


module "alb" {
  source = "./modules/alb"


  vpc_id            = module.vpc.vpc_id
  alb_sg_ids        = [module.sg.alb_sg_id]
  public_subnet_ids = module.vpc.public_subnets_ids
  certificate_arn   = module.acm.certificate_arn
  depends_on        = [module.acm]
  alb_name              = var.alb_name
  alb_internal          = var.alb_internal
  target_group_name     = var.target_group_name
  target_group_port     = var.target_group_port
  target_group_protocol = var.target_group_protocol
  alb_type              = var.alb_type

  health_check_path     = var.health_check_path
  health_check_port     = var.health_check_port
  health_check_protocol = var.health_check_protocol
  healthy_threshold     = var.healthy_threshold
  unhealthy_threshold   = var.unhealthy_threshold
  timeout               = var.timeout
  health_check_interval = var.health_check_interval
  health_check_matcher  = var.health_check_matcher

  http_listener_port     = var.http_listener_port
  http_listener_protocol = var.http_listener_protocol

  https_listener_port  = var.https_listener_port
  https_listener_protocol = var.https_listener_protocol
  redirect_status_code = var.redirect_status_code

  ssl_policy      = var.ssl_policy
  

} 




#Route53 module call

module "route53" {
  source = "./modules/route53"

  hosted_zone_name = var.hosted_zone_name
  domain_name      = var.domain_name
  record_type      = var.record_type

alb_dns_name = module.alb.alb_dns_name
alb_zone_id  = module.alb.alb_hosted_zone_id

}


#Acm module call

module "acm" {
  source = "./modules/acm"


  hosted_zone_name      = var.hosted_zone_name
  domain_name           = var.domain_name
  validation_method     = var.validation_method
  certificate_name      = var.certificate_name
  validation_record_ttl = var.validation_record_ttl

}

#Iam module call

module "iam" {
  source = "./modules/iam"

  iam_role_name = var.iam_role_name
  policy_arn    = var.policy_arn

}

#Ecs module call

module "ecs" {
  source = "./modules/ecs"

 ecr_repository_name = var.ecr_repository_name



  ecs_cluster_name       = var.ecs_cluster_name
  task_definition_family = var.task_definition_family
  task_cpu               = var.task_cpu
  task_memory            = var.task_memory
  operating_system_family = var.operating_system_family
  cpu_architecture        = var.cpu_architecture

  execution_role_arn  = module.iam.iam_role_name_arn
  container_name      = var.container_name
  container_cpu       = var.container_cpu
  container_memory    = var.container_memory
  container_essential = var.container_essential

  container_port     = var.container_port
  container_protocol = var.container_protocol

  efs_volume_name    = var.efs_volume_name
  efs_container_path = var.efs_container_path

  efs_file_system_id = module.efs.efs_file_id

  ecs_service_name         = var.ecs_service_name
  desired_task_count       = var.desired_task_count
  fargate_platform_version = var.fargate_platform_version
  capacity_provider        = var.capacity_provider
  capacity_provider_weight = var.capacity_provider_weight
  capacity_provider_base   = var.capacity_provider_base

  private_subnet_ids    = module.vpc.private_subnets_ids
  ecs_security_group_id = module.sg.ecs_sg_id

  target_group_arn = module.alb.tg_arn


}



#efs module call

module "efs" {
  source = "./modules/efs"

  creation_token = var.creation_token
  encrypted      = var.encrypted
  name           = var.name

  performance_mode = var.performance_mode
  throughput_mode  = var.throughput_mode
  transition_to_ia = var.transition_to_ia

  transition_to_primary_storage_class = var.transition_to_primary_storage_class

  private_subnet_ids     = module.vpc.private_subnets_ids
  efs_security_group_ids = [module.sg.efs_sg_id]


}
