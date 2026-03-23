variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for the ALB"
  type        = list(string)
}

variable "ec2_instance_ids" {
  description = "List of EC2 instance IDs to register with the target group"
  type        = list(string)
}

variable "project_name" {
  description = "Used for naming and tagging all resources"
  type        = string
}