output "sg_arn" {
  value = aws_security_group.lb.arn
}

output "target_group_arn" {
  value = one(aws_lb_target_group.lb_target_group[*].arn)
}

output "target_group_name" {
  value = one(aws_lb_target_group.lb_target_group[*].name)
}