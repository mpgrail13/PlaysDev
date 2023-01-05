output "bastion_ips" {
  value = aws_instance.bastion[*].public_ip 
}

output "private_ips" {
  value = aws_instance.private[*].private_ip
}
