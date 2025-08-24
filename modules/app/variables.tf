variable "ami" {
    description = "The AMI to use for the instance"
    type        = string
  
}
variable "instance_type" {
    description = "The type of instance to use"
    type        = string
  
}
variable "app_sg_id" {
    description = "The security group ID for the app server"
    type        = string
  
}

variable "private_subnet-1_id" {
    description = "The ID of the private subnet 1"
    type        = string
  
}