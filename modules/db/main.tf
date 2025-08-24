resource "aws_db_subnet_group" "my_db_subnet_group" {
  name       = "my-db-subnet-group"
  subnet_ids = [var.private_subnet-1_id, var.private_subnet-2_id]
  tags = {
    Name = "my_costom_db_subnet_group"
  }
  
}


resource "aws_db_instance" "my_db_instance" {
  identifier              = "my-db-instance"
  engine                  = "mysql"
  engine_version = "8.0"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  storage_type            = "gp2"
  username                = var.db_username
  password                = var.db_password


  db_subnet_group_name    = aws_db_subnet_group.my_db_subnet_group.name
  vpc_security_group_ids  = [var.db_sg_id]
  skip_final_snapshot     = true
  publicly_accessible     = false   

  tags = {
    Name = "my_db_instance"
  }
  
}

output "db_endpoint" {
  value = aws_db_instance.my_db_instance.endpoint
}
