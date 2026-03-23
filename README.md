# AWS Three-Tier Infrastructure with Terraform

A production-grade, modular three-tier application infrastructure 
on AWS provisioned entirely with Terraform.

## Architecture
```
INTERNET
    |
[ Internet Gateway ]
    |
┌─────────── VPC: 10.0.0.0/16 ───────────────┐
│  PUBLIC SUBNETS                            │
│  [ public-1a: 10.0.1.0/24 ]                │
│  [ public-1b: 10.0.2.0/24 ]                │
│       | NAT GW (in public-1a)              │
│  [ Application Load Balancer ]             │
│       |                  |                 │
│  PRIVATE SUBNETS                           │
│  [ private-1a: 10.0.3.0/24 ]               │
│  [ private-1b: 10.0.4.0/24 ]               │
│  [ EC2 App Server 1 ] [ EC2 App Server 2 ] │ 
└────────────────────────────────────────────┘
[ S3 Bucket: Terraform Remote State ]
```

## What Gets Created

| Resource | Details |
|---|---|
| VPC | 10.0.0.0/16 with DNS enabled |
| Public Subnets | 2 subnets across us-east-1a and us-east-1b |
| Private Subnets | 2 subnets across us-east-1a and us-east-1b |
| Internet Gateway | Attached to VPC for public internet access |
| NAT Gateway | Single-AZ, placed in public-1a |
| EC2 Instances | 2 x t3.micro running Amazon Linux 2023 |
| Application Load Balancer | Public-facing, spans both public subnets |
| Target Group | Both EC2 instances registered on port 80 |
| Security Groups | ALB and EC2 with least-privilege rules |
| Remote State | Stored in S3 with encryption and locking |

## Module Structure
```
modules/
├── networking/     # VPC, Subnets, IGW, NAT GW, Route Tables
├── compute/        # EC2 Instances, Security Groups
└── load_balancer/  # ALB, Target Group, Listener
```

## Prerequisites

- AWS CLI installed and configured (`aws configure`)
- Terraform v1.6 or higher
- An S3 bucket for remote state storage

## How to Deploy

**1. Clone the repository**
```bash
git clone https://github.com/saadoxo/aws-three-tier-terraform.git
cd aws-three-tier-terraform
```

**2. Create a terraform.tfvars file**
```hcl
aws_region           = "us-east-1"
project_name         = "three-tier-app"
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b"]
instance_type        = "t3.micro"
ami_id               = "ami-xxxxxxxxxxxxxxxxx"
```

**3. Update backend.tf with your S3 bucket name**

**4. Initialise and deploy**
```bash
terraform init
terraform plan
terraform apply
```

**5. Access the application**

After apply completes, copy the `alb_dns_name` output and paste 
it into your browser.

## How to Destroy
```bash
terraform destroy
```

Then manually delete the S3 backend bucket from the AWS Console.

