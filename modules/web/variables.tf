variable "ami" {
    description = "The AMI to use for the instance"
    type        = string
  
}
variable "instance_type" {
    description = "The type of instance to use"
    type        = string
  
}

variable "web_sg_id" {
    description = "The security group ID for the web server"
    type        = string
  
}
variable "public_subnet_id" {
    description = "The ID of the public subnet"
    type        = string
  
}