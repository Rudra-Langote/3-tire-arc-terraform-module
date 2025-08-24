resource "aws_instance" "my_web_server" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = "Ubuntu"
  subnet_id       = var.public_subnet_id
  security_groups = [var.web_sg_id]
  associate_public_ip_address = true
  tags = {
    Name = "my_web_server"
  }

}

resource "null_resource" "local_exec" {
    depends_on = [ aws_instance.my_web_server ]
  provisioner "local-exec" {
    command = <<-EOT
        echo ${aws_instance.my_web_server.public_ip} > public_ip_address.txt && echo ${aws_instance.my_web_server.private_ip} > private_ip_address.txt && echo ${aws_instance.my_web_server.id} > instance_id.txt
        EOT 
  }

}
resource "null_resource" "remote_exec" {
  depends_on = [aws_instance.my_web_server]
  provisioner "remote-exec" {
    connection {
      host        = aws_instance.my_web_server.public_ip
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("~/Downloads/Ubuntu.pem")
    }
    inline = [
      "sudo apt update -y",
      "sudo apt install nginx -y",
      "sudo service nginx start",
      "cd /var/www/html",
      "sudo rm *.html",
      "sudo sh -c \"echo '<h1> Deployed by Terraform </h1>' > index.html\""
    ]
  }



}

output "instance_public_ip" {
  value = aws_instance.my_web_server.public_ip
}
