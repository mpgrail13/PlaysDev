resource "aws_db_subnet_group" "task13_group" {
  name = "task13_group"
  subnet_ids = var.subnet_ids[*]
}

resource "aws_db_instance" "task13db" {
  allocated_storage = 20
  auto_minor_version_upgrade = false
  availability_zone = "eu-central-1a"
  db_name = "task13db"
  db_subnet_group_name = aws_db_subnet_group.task13_group.id
  engine = var.engine
  engine_version = var.engine_version
  instance_class = var.instance_class
  username = var.username
  password = var.password
  parameter_group_name = var.parameter
  skip_final_snapshot = true
  vpc_security_group_ids = [var.db_sg_id]
}
