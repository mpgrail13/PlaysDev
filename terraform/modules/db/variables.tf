variable "engine" {
  default = "postgres"
}

variable "engine_version" {
  default = "13.7"
}

variable "instance_class" {
  default = "db.t3.micro"
}

variable "username" {
  default = "postgres"
}

variable "password" {
  default = "postgres"
}

variable "parameter" {
  default = "default.postgres13"
}

variable "db_sg_id" {
  default = "id"
}

variable "subnet_ids" {
  default = [
    "id1",
    "id2"
  ] 
}
