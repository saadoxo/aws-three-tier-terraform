variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the two public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for the two private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "The two AZs where subnets will live"
  type        = list(string)
}

variable "project_name" {
  description = "Used for naming and tagging all resources"
  type        = string
}