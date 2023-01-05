output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr" {
  value = module.vpc.vpc_cidr
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "elastic_ips" {
  value = module.vpc.elastic_ip
}

output "sg_id" {
  value = module.sg.sg_id
}

output "db_sg_id" {
  value = module.sg.db_sg_id
}

output "bastion_ips" {
  value = module.ec2.bastion_ips
}

output "db_endpoint" {
  value = module.db.db_endpoint
}
