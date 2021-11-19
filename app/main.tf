terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.16.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "ebs" {
  source                = "../modules/ebs"
  ebs_availability_zone = var.availability_zone
  ebs_size              = 5
}

module "public_ip" {
  source = "../modules/public_ip"
}

module "security_group" {
  source = "../modules/security"
}

module "ec2" {
  source            = "../modules/ec2"
  instance_type     = var.instance_type
  eip_allocation_id = module.public_ip.allocation_id
  sg_name           = module.security_group.sg_name
  ebs_volume_id     = module.ebs.volume_id
  availability_zone = var.availability_zone
  key_name          = var.key_name
  pem_key_path      = var.pem_key_path
}
