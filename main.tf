terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.region
}


module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr

}
module "security" {
  source = "./modules/security"
  vpc_id = module.vpc.vpc_id
}
module "web" {
  source = "./modules/web"
  ami           = var.ami
  instance_type = var.instance_type
  public_subnet_id = module.vpc.public_subnet_id
  web_sg_id = module.security.web_sg_id
}
module "app" {
  source = "./modules/app"
  ami           = var.ami
  instance_type = var.instance_type
  private_subnet-1_id = module.vpc.private_subnet-1_id
  app_sg_id = module.security.app_sg_id
  
}

module "db" {
  source = "./modules/db"
  db_username = var.db_username
  db_password = var.db_password
  db_sg_id = module.security.db_sg_id
  private_subnet-1_id = module.vpc.private_subnet-1_id
  private_subnet-2_id = module.vpc.private_subnet-2_id
}
















