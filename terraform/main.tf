provider "aws" {
  region = "eu-central-1"
}

module "vpc" {
  source = "./modules/vpc"
}

module "sg" {
  source = "./modules/sg"
  vpc-id = module.vpc.vpc_id
}

module "ec2" {
  source = "./modules/ec2"
  public_subnet_ids = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
  sg_id = module.sg.sg_id
}

module "db" {
  source = "./modules/db"
  subnet_ids = module.vpc.private_subnet_ids
  db_sg_id = module.sg.db_sg_id
}
