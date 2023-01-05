resource "aws_instance" "bastion" {
  count = length(var.public_subnet_ids)
  ami = var.ami
  instance_type = var.type
  subnet_id = element(var.public_subnet_ids[*], count.index)
  vpc_security_group_ids = [var.sg_id]
  key_name = aws_key_pair.task13.id
}

resource "aws_key_pair" "task13" {
  key_name = "task13"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDOS/sQC+4W6a3sm3dUMfx7qwJFzCQhn01O9AtmL0b+f7WA3c+6ydJsANBWYi6ZFRGcDOfI/6lDbHmnv+ykjNXUFSce+qQD8GzRCuLscFlsp1wYjhvHpKdvlwHYYsz4hL6j6PeaDD+0tk04/38/mRSVteO9af3vJ8v6z2KmA3V6uduRr8qAtAM6ix5IbUkHgBGpcOGxJybg0F24dDtGAInuJIh+dmcV9HNeOnsVrGYAKTiVOkmIfKOkmpyO1wxFbwUkqBQulFnvcDn2bfVQ0OxG6DE/ke6kEk4H0iV29vSaV1Fmky9C3tfNA6GuLtRcI68TQHjYCSjhI9e9/DCcRdobhgdFjkymlhdkYkw30FmrIULCRedSm9PiDGHqb2PYEzLWI5+4a/1TjCvidWrKdw3eEctJruw6kKg3k906nZxko4LAGOBXnx017rriXWGTdLXbzaHziqjCL9gtNdIKqEc75pVLbyGHdkvHbqCE+OXiux23d8KWm+nitoEGmCu6oS0= sergun@DESKTOP-C1MGQFP"
}

resource "aws_instance" "private" {
  count = length(var.private_subnet_ids)
  ami = var.ami
  instance_type = var.type
  subnet_id = element(var.private_subnet_ids[*], count.index)
  vpc_security_group_ids = [var.sg_id]
  key_name = aws_key_pair.task13.id
}
