
resource "aws_efs_file_system" "gatus" {
  creation_token = var.creation_token
  encrypted      = var.encrypted

  performance_mode = var.performance_mode
  throughput_mode  = var.throughput_mode

  lifecycle_policy {
    transition_to_ia = var.transition_to_ia
  }

  lifecycle_policy {
    transition_to_primary_storage_class = var.transition_to_primary_storage_class
  }

  tags = {
    Name = var.name
  }
}

resource "aws_efs_mount_target" "gatus_mount" {
  for_each = {
    subnet_a = var.private_subnet_ids[0]
    subnet_b = var.private_subnet_ids[1]
  }

  file_system_id  = aws_efs_file_system.gatus.id
  subnet_id       = each.value
  security_groups = var.efs_security_group_ids
}