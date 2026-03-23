# ─── NETWORKING MODULE ────────────────────────────────────────────────────────
module "networking" {
  source = "./modules/networking"

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
  project_name         = var.project_name
}

# ─── LOAD BALANCER MODULE ─────────────────────────────────────────────────────
module "load_balancer" {
  source = "./modules/load_balancer"

  vpc_id            = module.networking.vpc_id
  public_subnet_ids = module.networking.public_subnet_ids
  ec2_instance_ids  = module.compute.ec2_instance_ids
  project_name      = var.project_name
}

# ─── COMPUTE MODULE ───────────────────────────────────────────────────────────
module "compute" {
  source = "./modules/compute"

  vpc_id                = module.networking.vpc_id
  private_subnet_ids    = module.networking.private_subnet_ids
  alb_security_group_id = module.load_balancer.alb_security_group_id
  ami_id                = var.ami_id
  instance_type         = var.instance_type
  project_name          = var.project_name
}