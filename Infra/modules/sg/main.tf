resource "aws_security_group" "alb" {
  name        = var.alb_sg_name
  description = var.alb_sg_description
  vpc_id      = var.vpc_id

  tags = {
    name = var.alb_sg_name
  }

}

# Inbound Rules

resource "aws_vpc_security_group_ingress_rule" "alb_http" {
  security_group_id = aws_security_group.alb.id

  cidr_ipv4   = var.alb_ingress_cidr
  from_port   = var.http_port
  to_port     = var.http_port
  ip_protocol = var.tcp_protocol
}


resource "aws_vpc_security_group_ingress_rule" "alb_https" {
  security_group_id = aws_security_group.alb.id

  cidr_ipv4   = var.alb_ingress_cidr
  from_port   = var.https_port
  to_port     = var.https_port
  ip_protocol = var.tcp_protocol
}

# Outbound Rules

resource "aws_vpc_security_group_egress_rule" "alb_ecs" {
  security_group_id = aws_security_group.alb.id

  from_port   = var.application_port
  to_port     = var.application_port
  ip_protocol = var.tcp_protocol

  referenced_security_group_id = aws_security_group.ecs_task.id
}


# ECS SG

resource "aws_security_group" "ecs_task" {
  name        = var.ecs_sg_name
  description = var.ecs_sg_description
  vpc_id      = var.vpc_id

  tags = {
    Name = var.ecs_sg_name
  }
}
resource "aws_vpc_security_group_ingress_rule" "alb_to_ecs" {
  security_group_id = aws_security_group.ecs_task.id
  from_port         = var.application_port
  to_port           = var.application_port
  ip_protocol       = var.tcp_protocol


  referenced_security_group_id = aws_security_group.alb.id

}

resource "aws_vpc_security_group_egress_rule" "ecs_to_efs" {
  security_group_id = aws_security_group.ecs_task.id
  from_port         = var.efs_port
  to_port           = var.efs_port
  ip_protocol       = var.tcp_protocol

  referenced_security_group_id = aws_security_group.efs.id

}

resource "aws_vpc_security_group_egress_rule" "ecs_outbound" {
  security_group_id = aws_security_group.ecs_task.id

  cidr_ipv4   = var.ecs_outbound_cidr
  ip_protocol = var.ip-protocol-1
}

#-------------------


# Create the security group used by the EFS mount targets
resource "aws_security_group" "efs" {
  name        = var.efs_sg_name
  description = var.efs_sg_description
  vpc_id      = var.vpc_id

  tags = {
    Name = var.efs_sg_name
  }
}




resource "aws_vpc_security_group_ingress_rule" "efs_from_ecs" {
  security_group_id = aws_security_group.efs.id


  referenced_security_group_id = aws_security_group.ecs_task.id

  from_port   = var.efs_port
  to_port     = var.efs_port
  ip_protocol = var.tcp_protocol
}
