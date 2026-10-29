resource "aws_alb" "gatus_alb" {
  name           = var.alb_name
  internal       = var.alb_internal
  security_groups = var.alb_sg_ids
  subnets        = var.public_subnet_ids

  tags = {
    name_tag = var.alb_name
  }

}


resource "aws_lb_target_group" "gatus_tg" {
  name                  = var.target_group_name
  port                  = var.target_group_port
  protocol              = var.target_group_protocol
  vpc_id                = var.vpc_id
  target_type           = var.alb_type

  health_check {
    path                = var.health_check_path
    port                = var.health_check_port
    protocol            = var.health_check_protocol
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    timeout             = var.timeout
    interval            = var.health_check_interval
    matcher             = var.health_check_matcher
  }

}





resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_alb.gatus_alb.arn
  port              = var.http_listener_port
  protocol          = var.http_listener_protocol

  default_action {
    type = "redirect"

    redirect {
      port        = var.https_listener_port
      protocol    = var.https_listener_protocol
      status_code = var.redirect_status_code
    }
  }
}


resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_alb.gatus_alb.arn
  port              = var.https_listener_port
  protocol          = var.https_listener_protocol
  ssl_policy        = var.ssl_policy
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.gatus_tg.arn
  }
} 