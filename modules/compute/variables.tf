variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for EC2 instances"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "Security group ID of the ALB"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "project_name" {
  description = "Used for naming and tagging all resources"
  type        = string
}