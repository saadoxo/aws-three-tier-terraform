output "alb_dns_name" {
  description = "Paste this URL into your browser to test the infrastructure"
  value       = module.load_balancer.alb_dns_name
}

output "vpc_id" {
  description = "The ID of the created VPC"
  value       = module.networking.vpc_id
}

output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = module.networking.nat_gateway_id
}

output "ec2_instance_ids" {
  description = "The IDs of the two EC2 app servers"
  value       = module.compute.ec2_instance_ids
}

output "ec2_private_ips" {
  description = "Private IP addresses of the EC2 instances"
  value       = module.compute.ec2_private_ips
}
