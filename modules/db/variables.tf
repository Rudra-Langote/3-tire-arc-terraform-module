variable "db_username" {
    description = "The username for the database"
    type        = string
  
}
variable "db_password" {
    description = "The password for the database"
    type        = string
    sensitive   = true
}

variable "db_sg_id" {
    description = "The security group ID for the database"
    type        = string
  
}
variable "private_subnet-1_id" {
    description = "The ID of the private subnet 1"
    type        = string
  
}
variable "private_subnet-2_id" {
    description = "The ID of the private subnet 2"
    type        = string
  
}