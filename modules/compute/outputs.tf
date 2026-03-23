output "ec2_instance_ids" {
  description = "List of EC2 instance IDs"
  value       = aws_instance.app[*].id
}

output "ec2_private_ips" {
  description = "List of EC2 private IP addresses"
  value       = aws_instance.app[*].private_ip
}

output "ec2_security_group_id" {
  description = "The security group ID for EC2 instances"
  value       = aws_security_group.ec2.id
}