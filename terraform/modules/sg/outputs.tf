output "sg_id" {
  value = aws_security_group.task13-ssh.id
}

output "db_sg_id" {
  value = aws_security_group.database-sg.id
}
