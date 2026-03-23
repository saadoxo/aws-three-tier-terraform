variable "aws_region" {
  description = "The AWS region where all resources will be created"
  type        = string
}

variable "project_name" {
  description = "A short name for the project, used to name and tag resources"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "A list of two CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "A list of two CIDR blocks for private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "A list of two AZ names"
  type        = list(string)
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ami_id" {
  description = "The Amazon Machine Image ID for EC2 instances"
  type        = string
}
