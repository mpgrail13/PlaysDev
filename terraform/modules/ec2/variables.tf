variable "ami" {
  default = "ami-06ce824c157700cd2"
}

variable "type" {
  default = "t2.micro"
}

variable "public_subnet_ids" {
  default = [ 
    "id1",
    "id2"
  ]
}

variable "private_subnet_ids" {
  default = [
    "id1",
    "id2"
  ]
}

variable "sg_id" {
  default = "id"
}
