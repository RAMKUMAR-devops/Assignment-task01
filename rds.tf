resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = [aws_subnet.my_private_subnet_1.id, aws_subnet.my_private_subnet_2.id]

  tags = { 
    Name = "RDS DB subnet group" 
  }
}

resource "aws_db_instance" "rds" {
  identifier             = "rds"
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  name                   = "mydb"
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.id
  vpc_security_group_ids = ["${aws_security_group.rds_sg.id}"]
  username               = "${var.rds_username}"
  password               = "${var.rds_password}"

  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}
