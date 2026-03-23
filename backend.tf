terraform {
  backend "s3" {
    bucket       = "terraform-state-three-tier-saad-2026-395063533284-us-east-1-an"
    key          = "three-tier/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}