output "vpc_id" {
  value = aws_vpc.task13-vpc.id
}

output "vpc_cidr" {
  value = aws_vpc.task13-vpc.cidr_block
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnets[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private_subnets[*].id
}

output "elastic_ip" {
  value = aws_eip.nat[*].public_ip
}
