resource "aws_instance" "my_private_server" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name = "Ubuntu"
  subnet_id     = var.private_subnet-1_id
  security_groups = [var.app_sg_id]
  tags = {
    Name = "my_private_server"
  }
}

output "private_instance_ip" {
  value = aws_instance.my_private_server.private_ip
}